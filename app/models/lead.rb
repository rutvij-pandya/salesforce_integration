class Lead < ActiveRecord::Base

  belongs_to :user

  enum status: [:open_not_contacted, :working_contacted, :closed_converted, :closed_not_converted]

end
