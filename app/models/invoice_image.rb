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
class InvoiceImage < ApplicationRecord
  enum status: %i(created sorted)

  validates :image_url, :client_id, presence: true

  belongs_to :uploader, foreign_key: :uploader_id, class_name: 'ClientStaff'
  belongs_to :client, foreign_key: :client_id, class_name: 'Client'
  belongs_to :sorter, foreign_key: :sorter_id, class_name: 'Encoder', optional: true
  belongs_to :invoice, optional: true
end
