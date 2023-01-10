module TopHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by(id: user_id)
    end
  end
  
  def correct_user
    redirect_to root_url, 
    flash: { danger: '正しいユーザーでログインしてください' } unless current_user&.id == params[:id].to_i
  end
  
  def correct_dog
    redirect_to root_url, flash: { danger: '正しいユーザーでログインしてください' } unless current_user&.id == Dog.find(params[:id]).user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
