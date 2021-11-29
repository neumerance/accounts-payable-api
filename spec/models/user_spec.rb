require 'rails_helper'

describe User, type: :model do
  it do
    should define_enum_for(:role)
      .with_values(%i(admin client accounts_payable_officer encoder))
  end
end
