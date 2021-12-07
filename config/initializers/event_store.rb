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
    store.subscribe(Ap::Reactors::OnInvoiceCreated, to: [Ap::Events::InvoiceCreated])
    store.subscribe(Ap::Reactors::OnInvoiceSorted, to: [Ap::Events::InvoiceSorted])
  end

  Rails.configuration.command_bus.tap do |bus|
    bus.register(Ap::Commands::MakeInvoice, Ap::Commands::OnMakeInvoice.new)
    bus.register(Ap::Commands::SortInvoice, Ap::Commands::OnSortInvoice.new)
  end
end
