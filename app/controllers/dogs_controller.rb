class DogsController < ApplicationController
  before_action :current_user,  only: %i[new create]
  before_action :correct_dog,  only: %i[edit update destroy]
  
  def index
    @dogs = Dog.all
  end
  
  def show
    @dog = Dog.find_by(params[:id])
  end

  def new
    @dog = Dog.new
  end
  
  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to current_user
    else
      flash[:danger] = '失敗しました'
      render 'new'
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      flash[:success] = '更新が完了しました'
      redirect_to current_user
    else
      render 'edit'
    end
  end
  
  def destroy
    @dog = Dog.find(params[:id])
    if @dog.destroy
      redirect_to current_user
    else
      redirect_to 'edit'
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:user_id, :name, :breeds, :sex, :weight, :birthday)
  end
end
