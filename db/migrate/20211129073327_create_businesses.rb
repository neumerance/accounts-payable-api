class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.references :company, index: true
      t.string :name
      t.jsonb :address
      t.string :phone
      t.string :email
      t.string :website
      t.timestamps
    end
  end
end
