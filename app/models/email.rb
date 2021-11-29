class Email < ApplicationRecord
  enum type: %i(business personal)
end
