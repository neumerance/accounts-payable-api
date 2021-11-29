class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.string email
      t.integer type
      t.timestamps
    end
  end
end
