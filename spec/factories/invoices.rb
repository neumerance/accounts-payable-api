# == Schema Information
#
# Table name: invoices
#
#  id             :bigint           not null, primary key
#  discount       :decimal(3, 2)
#  image_urls     :string           default([]), is an Array
#  invoice_number :string
#  is_paid?       :boolean          default(FALSE)
#  locked_at      :date
#  status         :integer
#  sub_total      :decimal(10, 2)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  business_id    :bigint
#  job_order_id   :string
#  locked_by_id   :integer
#  sorter_id      :integer
#  uploader_id    :integer
#  user_id        :bigint
#
# Indexes
#
#  index_invoices_on_business_id  (business_id)
#  index_invoices_on_user_id      (user_id)
#
FactoryBot.define do
  factory :invoice do
    client { build(:client) }
    sorter { build(:encoder) }

    after(:build) do |invoice|
      invoice.uploader = build(:client_staff, client: invoice.client)
    end
  end
end
