module Ap
  module Reactors
    class OnInvoiceCreated
      attr_accessor :data

      def call(event)
        @data = event.data

        Invoice.create(
          job_order_id: data[:id],
          image_urls: data[:image_urls],
          client: client,
          uploader: uploader,
          status: :created
        )
      end

      private

      def client
        Client.find(data[:client_id])
      end

      def uploader
        ClientStaff.find(data[:uploader_id])
      end
    end
  end
end
