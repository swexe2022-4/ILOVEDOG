module TopHelper
  def current_user
    @current_user ||= User.find_by(email: session[:email])
  end
  
  def log_in(user)
    session[:id] = user.id
  end
end
