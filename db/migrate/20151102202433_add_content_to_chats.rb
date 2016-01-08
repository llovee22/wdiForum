class AddContentToChats < ActiveRecord::Migration
  def change
    add_column :chats, :content, :text
  end
end
