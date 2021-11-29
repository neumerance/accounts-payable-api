require 'rails_helper'

describe Invoice, type: :model do
  describe 'associations' do
    it { should belong_to :client }
  end
end
