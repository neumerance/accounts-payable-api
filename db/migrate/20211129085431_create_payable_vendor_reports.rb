class CreatePayableVendorReports < ActiveRecord::Migration[6.0]
  def change
    create_table :payable_vendor_reports do |t|
      t.references :invoice_payable_report
      t.references :business
      t.boolean :is_paid?, default: false
      t.decimal :payable_amount, precision: 10, scale: 2
      t.datetime :paid_at
      t.references :user
      t.timestamps
    end
  end
end
