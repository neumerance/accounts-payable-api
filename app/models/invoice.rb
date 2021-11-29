class Invoice < ApplicationRecord
  enum status: %i(sorted rejected encoding encoded verifying verified approved)

  belongs_to :client, foreign_key: :user_id
  has_many :invoice_line_items
  has_many :comments, as: :commentable
end
