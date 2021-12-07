class AddImageUrlsToInvoice < ActiveRecord::Migration[6.0]
  def change
    remove_column :invoices, :image_url
    add_column :invoices, :image_urls, :string, array: true, default: []
  end
end
