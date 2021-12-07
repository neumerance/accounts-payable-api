module Ap
  module Commands
    class SortInvoice < Dry::Struct
      attribute :id, Types::String
      attribute :sorter_id, Types::Integer
      attribute :invoice_number, Types::String

      alias aggregate_id id
    end
  end
end
