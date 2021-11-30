require 'aggregate_root'

module Ap
  class Transaction
    include AggregateRoot

    attr_accessor :workflow_state

    def initialize(id)
      @id = id

      # :not_started, :started, :ended
      @workflow_state = :not_started
    end

    def make_invoice_job(params)
      raise Errors::WorkflowAlreadyStarted.new(params[:id]) if workflow_state == :started

      start_workflow(params)

      apply Events::InvoiceJobCreated.new(params)
    end

    private

    def start_workflow(params)
      raise Errors::WorkflowEnded.new(params[:id]) if workflow_state == :ended

      apply Events::WorkflowStarted.new
    end
  end
end
