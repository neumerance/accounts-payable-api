require 'rails_helper'

describe Invoice, type: :model do
  it do
    should define_enum_for(:status)
      .with_values(%i(sorted rejected encoding encoded verifying verified approved))
  end

  describe 'associations' do
    it { should belong_to :client }
    it { should have_many :invoice_line_items }
  end
end
