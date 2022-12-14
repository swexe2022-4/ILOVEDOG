class ItemsController < ApplicationController
    def index
        @items = Item.all
    end
    def new
        @item = Item.new
    end
    def create
        @item = Item.new(name: params[:item][:name], country_of_origin: params[:item][:country_of_origin], target_age: params[:item][:target_age], grams: params[:item][:grams], price: params[:item][:price], category: params[:item][:category], img: params[:item][:img])
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
        @item = Item.update(name: params[:item][:name], country_of_origin: params[:item][:country_of_origin], target_age: params[:item][:target_age], grams: params[:item][:grams], price: params[:item][:price], category: params[:item][:category], img: params[:item][:img])
        redirect_to '/'
    end
end
