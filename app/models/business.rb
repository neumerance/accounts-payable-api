# == Schema Information
#
# Table name: businesses
#
#  id         :bigint           not null, primary key
#  address    :jsonb
#  email      :string
#  name       :string
#  phone      :string
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_businesses_on_company_id  (company_id)
#
class Business < ApplicationRecord
  belongs_to :company
end
