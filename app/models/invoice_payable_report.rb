# == Schema Information
#
# Table name: invoice_payable_reports
#
#  id                :bigint           not null, primary key
#  name              :string
#  report_date_end   :date
#  report_start_date :date
#  status            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class InvoicePayableReport < ApplicationRecord
  has_one :webhook_request, as: :webhook_requestable #payment received webhook request
  has_many :payable_vendor_reports

  enum status: %i(pending rejected approved paid)
end
