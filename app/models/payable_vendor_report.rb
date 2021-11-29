# == Schema Information
#
# Table name: payable_vendor_reports
#
#  id                        :bigint           not null, primary key
#  is_paid?                  :boolean          default(FALSE)
#  paid_at                   :datetime
#  payable_amount            :decimal(10, 2)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  business_id               :bigint
#  invoice_payable_report_id :bigint
#  user_id                   :bigint
#
# Indexes
#
#  index_payable_vendor_reports_on_business_id                (business_id)
#  index_payable_vendor_reports_on_invoice_payable_report_id  (invoice_payable_report_id)
#  index_payable_vendor_reports_on_user_id                    (user_id)
#
class PayableVendorReport < ApplicationRecord
  has_one :webhook_request, as: :webhook_requestable # payment sent webhook request
  belongs_to :invoice_payable_report
  belongs_to :accounts_payable_officer, foreign_key: :user_id
end
