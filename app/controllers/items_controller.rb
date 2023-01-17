class ItemsController < ApplicationController
  before_action :admin_user,  only: %i[new create edit update destroy]

  def index
    @items = Item.all
    @items = @items.where(target_age: params[:target_age]) unless params[:target_age].blank?
  
    @items = @items.where(category: params[:category]) unless params[:category].blank?
  
    @items = @items.where(country_of_origin: params[:country_of_origin]) unless params[:country_of_origin].blank?
  end
  
  def show
    @item = Item.find(params[:id])
    @reviews = Review.all.where(item_id: params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to items_path
    else
      flash[:danger] = '失敗しました'
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to items_path
    else
      redirect_to 'edit'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = '更新が完了しました'
      redirect_to items_path
    else
      render 'edit'
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :country_of_origin, :target_age, :grams, :price, :category, :img, :user_id)
  end
end
