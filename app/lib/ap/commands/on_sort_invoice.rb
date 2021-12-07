module Ap
  module Commands
    class OnSortInvoice
      include Commands::CommandHandler

      def call(command)
        with_aggregate(Transaction, command.aggregate_id) do |transaction|
          transaction.sort_invoice(command.as_json.symbolize_keys)
        end
      end
    end
  end
end
