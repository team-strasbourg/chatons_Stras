module Admin
  class ItemsController < ApplicationController
    def index
      @items = Item.all
    end

    def show
      @item = Item.find(params[:id])
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
      Item.destroy(params[:id])
      flash[:success] = "Item successfully deleted"
      redirect_to admin_items_path
    end
  end
end