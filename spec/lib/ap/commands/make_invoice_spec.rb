require 'rails_helper'

describe Ap::Commands::MakeInvoice  do
  subject(:command) { command_bus.(described_class.new(make_invoice_job_params)) }

  let(:command_bus) { Rails.configuration.command_bus }
  let(:event_store) { Rails.configuration.event_store }
  let(:client) do
    create(:client).tap do |client|
      client.client_staffs << create(:client_staff, client: client)
    end
  end
  let(:uploader) { client.client_staffs.last }
  let(:job_order_id) { UniqueIdGenerator.generateUUID(client.id, uploader.id) }
  let(:make_invoice_job_params) do
    {
      id: job_order_id,
      uploader_id: uploader.id,
      client_id: client.id,
      image_urls: [
        'https://www.example.com/file.pdf',
        'https://www.example.com/file2.pdf',
        'https://www.example.com/file3.pdf'
      ]
    }
  end

  it 'publish invoice created' do
    expect { command }.to publish(an_event(Ap::Events::InvoiceCreated)).in(event_store)

    invoice = Invoice.find_by(job_order_id: job_order_id)
    expect(invoice.uploader).to eq uploader
    expect(invoice.client).to eq client
    expect(invoice.image_urls).to containing_exactly(
      'https://www.example.com/file.pdf',
      'https://www.example.com/file2.pdf',
      'https://www.example.com/file3.pdf'
    )
  end
end
