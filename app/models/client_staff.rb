# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  token                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  parent_user_id         :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class ClientStaff < User
  default_scope { where(role: :client_staff) }

  belongs_to :client, foreign_key: :parent_user_id
end
