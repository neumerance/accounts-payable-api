# == Schema Information
#
# Table name: invoices
#
#  id             :bigint           not null, primary key
#  discount       :decimal(3, 2)
#  image_urls     :string           default([]), is an Array
#  invoice_number :string
#  is_paid?       :boolean          default(FALSE)
#  locked_at      :date
#  status         :integer
#  sub_total      :decimal(10, 2)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  business_id    :bigint
#  job_order_id   :string
#  locked_by_id   :integer
#  sorter_id      :integer
#  uploader_id    :integer
#  user_id        :bigint
#
# Indexes
#
#  index_invoices_on_business_id  (business_id)
#  index_invoices_on_user_id      (user_id)
#
class Invoice < ApplicationRecord
  enum status: %i(created sorted rejected encoding encoded verifying verified approved)

  belongs_to :client, foreign_key: :user_id
  belongs_to :uploader, foreign_key: :uploader_id, class_name: 'ClientStaff'
  belongs_to :sorter, foreign_key: :sorter_id, class_name: 'Encoder', optional: true
  belongs_to :locked_by, foreign_key: :locked_by_id, class_name: 'Encoder', optional: true
  has_many :invoice_line_items
  has_many :comments, as: :commentable
  has_many :invoice_images
end
