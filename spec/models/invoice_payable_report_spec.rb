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
require 'rails_helper'

describe InvoicePayableReport, type: :model do
  it do
    should define_enum_for(:status)
      .with_values(%i(pending rejected approved paid))
  end

  describe 'associations' do
    it { should have_one(:webhook_request) }
    it { should have_many :payable_vendor_reports }
  end
end
