class User < ActiveRecord::Base
		has_secure_password
		before_save :default_values

		def default_values
			self.chatroom_id ||= 1
			self.user_type ||= "Student"
		end

		def is_instructor?
			user_type == "Instructor"
		end

		has_many :articles, dependent: :destroy
		has_many :comments, dependent: :destroy
		has_many :surveys, dependent: :destroy
		has_many :answers, dependent: :destroy
		has_one :inbox
		has_many :conversations, dependent: :destroy
		has_many :messages, dependent: :destroy
		belongs_to :chatroom
		has_many :chats, dependent: :destroy
		has_many :likes, dependent: :destroy
		has_many :announcements, dependent: :destroy

		validates_presence_of :fname, :lname, :password, :password_confirmation, :on => [ :create]
		validates_presence_of :fname, :lname, :on => [ :update]
		validates :username, uniqueness: true, length: {minimum: 3, maximum: 20}
		validates :verification, inclusion: { in: %w(awesome amazing)}, if: :is_instructor?
end
