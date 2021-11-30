module Ap
  module Reactors
    class OnInvoiceJobCreated
      attr_accessor :data

      def call(event)
        @data = event.data

        Invoice.create(
          job_order_id: data[:id],
          image_url: data[:image_url],
          client: client,
          uploader: uploader
        )
      end

      private

      def client
        Client.find(event.data[:client_id])
      end

      def uploader
        ClientStaff.find(event.data[:uploader_id])
      end
    end
  end
end
