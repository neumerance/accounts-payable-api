require 'rails_helper'

describe Ap::Events::InvoiceCreated do
  subject(:event) { described_class.new }

  it { is_expected.to be_an_event(described_class) }
end
