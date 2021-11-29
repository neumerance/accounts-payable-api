# == Schema Information
#
# Table name: phones
#
#  id         :bigint           not null, primary key
#  number     :string
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Phone < ApplicationRecord
  enum type: %i(office mobile home)
end
