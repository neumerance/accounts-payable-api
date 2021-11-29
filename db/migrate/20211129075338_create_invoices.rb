class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.references :user
      t.references :business
      t.decimal :sub_total, precision: 10, scale: 2
      t.decimal :discount, precision: 3, scale: 2
      t.boolean :is_paid?, default: false
      t.integer :status
      t.date :locked_at
      t.integer :locked_by_id
      t.timestamps
    end
  end
end
