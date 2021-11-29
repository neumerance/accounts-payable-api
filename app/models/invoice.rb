# == Schema Information
#
# Table name: invoices
#
#  id           :bigint           not null, primary key
#  discount     :decimal(3, 2)
#  is_paid?     :boolean          default(FALSE)
#  locked_at    :date
#  status       :integer
#  sub_total    :decimal(10, 2)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  business_id  :bigint
#  locked_by_id :integer
#  user_id      :bigint
#
# Indexes
#
#  index_invoices_on_business_id  (business_id)
#  index_invoices_on_user_id      (user_id)
#
class Invoice < ApplicationRecord
  enum status: %i(sorted rejected encoding encoded verifying verified approved)

  belongs_to :client, foreign_key: :user_id
  has_many :invoice_line_items
  has_many :comments, as: :commentable
end
