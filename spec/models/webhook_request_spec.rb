# == Schema Information
#
# Table name: webhook_requests
#
#  id                       :bigint           not null, primary key
#  body                     :jsonb
#  headers                  :jsonb
#  webhook_requestable_type :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  webhook_requestable_id   :bigint
#
# Indexes
#
#  webhook_index  (webhook_requestable_type,webhook_requestable_id)
#
require 'rails_helper'

RSpec.describe WebhookRequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
