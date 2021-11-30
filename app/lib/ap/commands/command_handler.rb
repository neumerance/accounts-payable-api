module Ap
  module Commands
    module CommandHandler
      def with_aggregate(aggregate_class, aggregate_id, &block)
        repository = AggregateRoot::Repository.new(Rails.configuration.event_store)
        # These commands are for to load the read model and return the correct object.
        # Since this returns the already exisitng / new object, duplicate ActiveRecord.find & state check
         # will help us find the duplicate and prevent application submission.
        aggregate = aggregate_class.new(aggregate_id)
        stream = stream_name(aggregate_class, aggregate_id)
        repository.with_aggregate(aggregate, stream, &block)
      end

      def rehydrate(aggregate, stream)
        repository = AggregateRoot::Repository.new(Rails.configuration.event_store)
        repository.load(aggregate, stream)
      end

      def stream_name(aggregate_class, aggregate_id)
        "#{aggregate_class.name}$#{aggregate_id}"
      end
    end
  end
end
