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
class Email < ApplicationRecord
  enum type: %i(business personal)
end
