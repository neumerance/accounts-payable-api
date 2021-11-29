class InvoiceLineItem < ApplicationRecord
  belongs_to :invoice, dependent: :destroy
end
