class AddUploaderAndJobOrderIdToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :uploader_id, :integer
    add_column :invoices, :image_url, :string
    add_column :invoices, :job_order_id, :string
  end
end
