class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :fname
      t.string :lname
      t.string :user_type
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
