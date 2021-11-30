module Ap
  module Errors
    class WorkflowEnded < StandardError
      def initialize(id)
        @id = id
      end

      def message
        msg = "Workflow for #{@id} has already been started"
      end
    end
  end
end
