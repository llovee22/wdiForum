class Announcement < ActiveRecord::Base

  before_save :default_values

  def default_values
    self.view ||= 0
  end

  belongs_to :user

  validates_presence_of :title, :content
  validates :title, length: {minimum: 5, maximum: 100}
  validates :content, length: {minimum: 10}
end
