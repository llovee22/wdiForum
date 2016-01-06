class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :count
      t.references :user, index: true, foreign_key: true
      t.references :survey, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
