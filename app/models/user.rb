class User < ApplicationRecord
  enum role: %i(admin client ap coder)
end
