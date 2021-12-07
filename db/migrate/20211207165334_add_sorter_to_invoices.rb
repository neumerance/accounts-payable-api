class AddSorterToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :sorter_id, :integer
  end
end
