class ItemsController < ApplicationController
    def index
        @items = Item.all
    end
    def new
        @item = Item.new
    end
    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to '/'
    end
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to '/'
    end
    def edit
        @item = Item.find(params[:id])
    end
    def update
        @item = Item.find(params[:id])
        @item = Item.update(item_params)
        redirect_to '/'
    end
    
    
    private
    
    def item_params
        params.require(:item).permit(:name, :country_of_origin, :target_age, :grams, :price, :category, :img)
    end
end
