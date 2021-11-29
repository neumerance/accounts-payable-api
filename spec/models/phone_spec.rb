# == Schema Information
#
# Table name: phones
#
#  id         :bigint           not null, primary key
#  number     :string
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

describe Phone, type: :model do
  it do
    should define_enum_for(:type)
      .with_values(%i(office mobile home))
  end
end
