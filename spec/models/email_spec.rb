# == Schema Information
#
# Table name: emails
#
#  id         :bigint           not null, primary key
#  email      :string
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

describe Email, type: :model do
  it do
    should define_enum_for(:type)
      .with_values(%i(business personal))
  end
end
