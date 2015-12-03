class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey

  validates :answer, length: {minimum: 2}
end
