class Company < ApplicationRecord
  has_many :businesses, dependent: :destroy
end
