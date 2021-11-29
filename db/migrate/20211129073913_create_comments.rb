class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, index: true
      t.references :user
      t.text :message
      t.timestamps
    end
  end
end
