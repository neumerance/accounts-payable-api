class User < ApplicationRecord
  enum role: %i(admin client accounts_payable_officer encoder)
end
