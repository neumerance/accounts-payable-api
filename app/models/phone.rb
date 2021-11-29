class Phone < ApplicationRecord
  enum type: %i(office mobile home)
end
