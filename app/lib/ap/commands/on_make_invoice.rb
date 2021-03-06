module Ap
  module Commands
    class OnMakeInvoice
      include Commands::CommandHandler

      def call(command)
        with_aggregate(Transaction, command.aggregate_id) do |transaction|
          transaction.make_invoice(command.as_json.symbolize_keys)
        end
      end
    end
  end
end
