class AddInvoiceNumberToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :invoice_number, :string
  end
end
