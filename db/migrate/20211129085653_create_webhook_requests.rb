class CreateWebhookRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :webhook_requests do |t|
      t.jsonb :body
      t.jsonb :headers
      t.references :webhook_requestable, polymorphic: true, index: { name: 'webhook_index' }
      t.timestamps
    end
  end
end
