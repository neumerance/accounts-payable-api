require 'rails_helper'

describe Email, type: :model do
  it do
    should define_enum_for(:type)
      .with_values(%i(business personal))
  end
end
