require 'aggregate_root'

module Ap
  class Transaction
    include AggregateRoot

    attr_accessor :workflow_state

    on Events::WorkflowStarted do |_event|
      @workflow_state = :started
    end

    on Events::InvoiceCreated do |_event|
    end

    def initialize(id)
      @id = id
    end

    def make_invoice_job(params)
      raise Errors::WorkflowAlreadyStarted.new(params[:id]) if workflow_state == :started

      start_workflow(params)

      apply Events::InvoiceCreated.new(data: params)
    end

    private

    def start_workflow(params)
      raise Errors::WorkflowEnded.new(params[:id]) if workflow_state == :ended

      apply Events::WorkflowStarted.new(data: params)
    end
  end
end
