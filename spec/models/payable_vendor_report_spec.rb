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
require 'rails_helper'

describe PayableVendorReport, type: :model do
  describe 'association' do
    it { should have_one(:webhook_request) }
    it { should belong_to(:invoice_payable_report) }
    it { should belong_to(:accounts_payable_officer) }
  end
end
