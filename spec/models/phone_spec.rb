require 'rails_helper'

describe Phone, type: :model do
  it do
    should define_enum_for(:type)
      .with_values(%i(office mobile home))
  end
end
