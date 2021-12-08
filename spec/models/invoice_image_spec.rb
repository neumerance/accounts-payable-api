# == Schema Information
#
# Table name: invoice_images
#
#  id          :bigint           not null, primary key
#  image_url   :string
#  status      :integer          default("created"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  client_id   :integer
#  invoice_id  :bigint
#  sorter_id   :integer
#  uploader_id :integer
#
# Indexes
#
#  index_invoice_images_on_client_id    (client_id)
#  index_invoice_images_on_invoice_id   (invoice_id)
#  index_invoice_images_on_sorter_id    (sorter_id)
#  index_invoice_images_on_uploader_id  (uploader_id)
#
require 'rails_helper'

describe InvoiceImage, type: :model do
  subject(:invoice_image) { create(:invoice_image) }

  it do
    should define_enum_for(:status)
      .with_values(%i(created sorted))
  end

  describe 'associations' do
    it { should belong_to :client }
    it { should belong_to(:uploader) }
    it { should belong_to(:sorter).optional }
  end
end
