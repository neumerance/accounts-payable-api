class CreateInvoiceImages < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_images do |t|
      t.string  :image_url
      t.integer :uploader_id, index: true
      t.integer :client_id, index: true
      t.integer :sorter_id, index: true
      t.integer :status, default: 0, null: false
      t.references :invoice, index: true
      t.timestamps
    end
  end
end
