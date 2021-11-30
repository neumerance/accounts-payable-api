module Ap
  module Errors
    class WorkflowEnded < StandardError
      def initialize(id)
        @id = id
      end

      def message
        msg = "Workflow for #{@id} has ended"
      end
    end
  end
end
