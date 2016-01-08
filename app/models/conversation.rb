class Conversation < ActiveRecord::Base
  belongs_to :inbox
  belongs_to :user
  has_many :messages
end
