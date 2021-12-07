require 'rails_helper'

describe Ap::Commands::SortInvoice  do
  subject(:command) { command_bus.(described_class.new(sort_invoice_params)) }

  let(:command_bus) { Rails.configuration.command_bus }
  let(:event_store) { Rails.configuration.event_store }
  let(:invoice) { create(:invoice, job_order_id: job_order_id) }
  let(:sorter) { create(:encoder) }
  let(:job_order_id) { '213232' }
  let(:sort_invoice_params) do
    {
      id: job_order_id,
      sorter_id: sorter.id,
      invoice_number: 'ADQA1223'
    }
  end

  it 'publish invoice created' do
    invoice

    expect { command }.to publish(an_event(Ap::Events::InvoiceSorted)).in(event_store)

    invoice.reload

    expect(invoice.sorter).to eq sorter
    expect(invoice.invoice_number).to eq 'ADQA1223'
    expect(invoice.status).to eq 'sorted'
  end
end
