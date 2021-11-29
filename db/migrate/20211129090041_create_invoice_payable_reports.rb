class CreateInvoicePayableReports < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_payable_reports do |t|
      t.string :name
      t.date :report_start_date
      t.date :report_date_end
      t.integer :status
      t.timestamps
    end
  end
end
