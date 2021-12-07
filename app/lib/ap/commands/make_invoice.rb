module Ap
  module Commands
    class MakeInvoice < Dry::Struct
      attribute :id, Types::String
      attribute :uploader_id, Types::Integer
      attribute :client_id, Types::Integer
      attribute :image_urls, Types::Array

      alias aggregate_id id
    end
  end
end
