class AddChatroomToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :chatroom, index: true, foreign_key: true
  end
end
