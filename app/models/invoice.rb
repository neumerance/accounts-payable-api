class Invoice < ApplicationRecord
  enum status: %i(sorted, rejected, encoding encoded verifying verified approved)

  has_many :invoice_line_items
  has_many :comments, as: :commentable
end
