class User < ActiveRecord::Base

  has_one :lead

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # after_create :generate_lead
  after_save :create_update_lead

  def name
    first_name.concat(" #{last_name}")
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  private

  # def generate_lead
  #   Rails.logger.info "------ user generate lead"
  #   Delayed::Job.enqueue(SalesforceLeadJob.new(id))
  # end

  def create_update_lead
    Rails.logger.info "------ user update lead"
    if (self.changed & ["first_name", "last_name", "company", "email", "phone"]).present?
      Rails.logger.info "------ user update lead - changed"
      Delayed::Job.enqueue(SalesforceLeadJob.new(id))
    end
  end

end
