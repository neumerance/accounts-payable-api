class CreateInvoiceLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_line_items do |t|
      t.references :invoice
      t.string :item
      t.text :description
      t.integer :quantity
      t.decimal :price, precision: 8, scale: 2
      t.decimal :amount, precision: 8, scale: 2
      t.timestamps
    end
  end
end
