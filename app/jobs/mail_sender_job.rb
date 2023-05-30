class MailSenderJob < ApplicationJob

  queue_as :default
  
  # self.queue_adapter = :sidekiq
  binding.pry
  def perform(email)
    EmailMailer.with(email).new_send_mail.deliver
  end
end
