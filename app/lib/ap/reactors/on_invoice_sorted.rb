module Ap
  module Reactors
    class OnInvoiceSorted
      attr_accessor :data

      def call(event)
        @data = event.data

        invoice.update!(
          status: :sorted,
          sorter: sorter,
          invoice_number: data[:invoice_number]
        )
      end

      private

      def invoice
        Invoice.find_by!(job_order_id: data[:id])
      end

      def sorter
        Encoder.find(data[:sorter_id])
      end
    end
  end
end
