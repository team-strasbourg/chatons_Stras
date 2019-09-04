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
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      if item.update(item_params)
        redirect_to admin_root_path
      else
        render 'edit'
      end
    end

    def destroy
      Item.destroy(params[:id])
      flash[:success] = "Item successfully deleted"
      redirect_to admin_items_path
    end

    private

    def item_params
      params[:item].permit(:title, :description, :price, :image_url)
    end
  end
end