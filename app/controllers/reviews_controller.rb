class ReviewsController < ApplicationController
  before_action :logged_in, only: %i[new create]
  def new
      @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to item_path(id: @review.item_id)
    else
      flash[:danger] = '失敗しました'
      redirect_to items_path
    end
  end
 
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to items_path
    else
      flash[:danger] = '失敗しました'
      redirect_to items_path
    end
  end
 
  def edit
    @review = Review.find(params[:id])
  end
 
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to item_path(id: @review.item_id)
    else
      flash[:danger] = '失敗しました'
      redirect_to items_path
    end
  end
  
  
  private
  
  def review_params
      params.require(:review).permit(:user_id, :item_id, :title, :body)
  end
  
  
end
