class UsersController < ApplicationController
  before_action :correct_user,  only: %i[edit update destroy]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @dogs = Dog.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      log_in @user
      flash[:success] = 'ログインに成功しました'
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/'
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user = User.update(user_params)
    redirect_to current_user
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :description)
  end
end
