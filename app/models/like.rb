class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  belongs_to :article
end
