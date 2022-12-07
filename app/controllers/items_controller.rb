class ItemsController < ApplicationController
    def index
        @items = Item.all 
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(name: params[:item][:name],)# email: params[:user][:email], pass: BCrypt::Password.create(params[:user][:pass]))
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
        @item = Item.update(name: params[:item][:name],)# email: params[:user][:email])
        redirect_to '/'
    end
end