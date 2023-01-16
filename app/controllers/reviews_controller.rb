class ReviewsController < ApplicationController
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
      render :new
    end
  end
 
  def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to '/'
  end
 
  def edit
      @review = Review.find(params[:id])
  end
 
  def update
      @review = Review.find(params[:id])
      @review = Review.update(review_params)
      redirect_to '/'
  end
  
  
  private
  
  def review_params
      params.require(:review).permit(:user_id, :item_id, :title, :body)
  end
end
