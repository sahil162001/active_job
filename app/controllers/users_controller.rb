class UsersController < ApplicationController
  def index 
    @users = User.all
  end

  def new 
     @user = User.new
  end

  def create 
    @user = User.new(params_mail)
    if @user.save 
      binding.pry
      MailSenderJob.set(wait: 1.minutes).perform_later(params_mail["email"])
      redirect_to users_path
    end
  end

  private 
  def params_mail
    params.require(:user).permit(:email)
  end
end
