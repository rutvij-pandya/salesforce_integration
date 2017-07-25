class Lead < ActiveRecord::Base

  belongs_to :user

  enum status: [:open, :contacted, :failed, :succeed, :closed]

end
