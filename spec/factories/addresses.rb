# == Schema Information
#
# Table name: addresses
#
#  id         :bigint           not null, primary key
#  address1   :string
#  address2   :string
#  city       :string
#  country    :string
#  state      :string
#  zip_code   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :address do
    
  end
end
