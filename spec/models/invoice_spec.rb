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
require 'rails_helper'

describe Invoice, type: :model do
  subject(:invoice) { create(:invoice) }

  it do
    should define_enum_for(:status)
      .with_values(%i(created sorted rejected encoding encoded verifying verified approved))
  end

  describe 'associations' do
    it { should belong_to :client }
    it { should belong_to(:uploader) }
    it { should belong_to(:sorter).optional }
    it { should belong_to(:locked_by).optional }
    it { should have_many :invoice_line_items }
  end
end
