class EmailMailer < ApplicationMailer
  def new_send_mail
    binding.pry
    @user = params
    mail(to: @user, subject: "You got a new mail!")
  end
end
