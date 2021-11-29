# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

describe User, type: :model do
  it do
    should define_enum_for(:role)
      .with_values(%i(admin client accounts_payable_officer encoder))
  end
end
