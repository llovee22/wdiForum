class Chatroom < ActiveRecord::Base
  has_many :users
  has_many :chats
end
