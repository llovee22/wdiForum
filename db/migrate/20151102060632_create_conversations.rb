class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :inbox, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
