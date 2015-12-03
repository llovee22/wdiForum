class Inbox < ActiveRecord::Base
  belongs_to :user
  has_many :conversations
end
