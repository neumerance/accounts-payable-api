# == Schema Information
#
# Table name: invoice_line_items
#
#  id          :bigint           not null, primary key
#  amount      :decimal(8, 2)
#  description :text
#  item        :string
#  price       :decimal(8, 2)
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  invoice_id  :bigint
#
# Indexes
#
#  index_invoice_line_items_on_invoice_id  (invoice_id)
#
class InvoiceLineItem < ApplicationRecord
  belongs_to :invoice, dependent: :destroy
end
