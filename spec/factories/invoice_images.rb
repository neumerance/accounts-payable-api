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
FactoryBot.define do
  factory :invoice_image do
    image_url { 'http://img.url/pdf1.pdf' }
    association :client

    after(:build) do |invoice_image|
      invoice_image.uploader = create(:client_staff, client: invoice_image.client)
    end
  end
end
