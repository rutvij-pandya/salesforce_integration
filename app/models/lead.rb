class Lead < ActiveRecord::Base

  belongs_to :user

  enum status: [:open_not_contacted, :working_contacted, :closed_converted, :closed_not_converted]

  def is_open?
    ["open_not_contacted", "working_contacted"].include? status
  end

  class << self
    def formatted_status(status)
      status.parameterize.gsub("-","_")
    end
  end
end
