require 'rails_event_store'
require 'aggregate_root'
require 'arkency/command_bus'
Rails.configuration.to_prepare do
  Rails.configuration.event_store = RailsEventStore::Client.new(
    dispatcher: RubyEventStore::ComposedDispatcher.new(
      RailsEventStore::AfterCommitAsyncDispatcher.new(scheduler: RailsEventStore::ActiveJobScheduler.new(serializer: YAML)),
       RubyEventStore::Dispatcher.new
      )
    )
  Rails.configuration.command_bus = Arkency::CommandBus.new
  AggregateRoot.configure do |config|
     config.default_event_store = Rails.application.config.event_store
  end


  Rails.configuration.event_store.tap do |store|
    store.subscribe(Ap::Reactors::OnInvoiceJobCreated, to: [Ap::Events::InvoiceJobCreated])
  end

  Rails.configuration.command_bus.tap do |bus|
    bus.register(Ap::Commands::MakeInvoiceJob, Ap::Commands::OnMakeInvoiceJob.new)
  end
end
