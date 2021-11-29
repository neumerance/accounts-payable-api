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
FactoryBot.define do
  factory :invoice_payable_report do
    
  end
end
