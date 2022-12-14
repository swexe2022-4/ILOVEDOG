class TopController < ApplicationController
  
  def new; end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
