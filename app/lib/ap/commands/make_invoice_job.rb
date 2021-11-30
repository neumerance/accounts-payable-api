module Ap
  module Commands
    class MakeInvoiceJob < Dry::Struct
      # these are mandatory system attributes
      attribute :id, Types::String
      attribute :uploader_id, Types::String
      attribute :client_id, Types::String
      attribute :image_url, Types::String

      alias aggregate_id id
    end
  end
end
