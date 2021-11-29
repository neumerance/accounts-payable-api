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
require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
