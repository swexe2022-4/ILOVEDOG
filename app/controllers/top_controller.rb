class TopController < ApplicationController
  include TopHelper
  def main
    if session[:email]
      render 'main'
    else
      render 'login'
    end
  end
  
  def logout
    session.delete(:email)
    redirect_to root_path
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      user_remember(user) if params[:session][:remember_me]
      redirect_back_or current_user
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが正しくありません'
      render 'client_new'
    end
  end
  
  def logout
    session.delete(:email)
    redirect_to root_path
  end

end
