class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(name: params[:user][:name], email: params[:user][:email], pass: BCrypt::Password.create(params[:user][:pass]))
    @user.save
    redirect_to '/'
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
    @user = User.update(name: params[:user][:name], email: params[:user][:email])
    redirect_to '/'
  end
end
