# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
    def index
      @items = Item.all.sort_by(&:id)
    end

    def show
      @item = Item.find(params[:id])
    end

    def new
      @item = Item.new
    end

    def create
      my_params=params[:item]
      @item = Item.new(title: my_params[:title],
                       description: my_params[:description],
                       price: my_params[:price],
                       image_url: my_params[:image_url])
      if @item.save
        flash[:success] = 'Item created'
        redirect_to admin_items_path
      else
        flash[:error]=@item.errors.messages
        render'new'
      end
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to admin_items_path
      else
        render 'edit'
      end
    end

    def destroy
      Item.destroy(params[:id])
      flash[:success] = 'Item successfully deleted'
      redirect_to admin_items_path
    end

    private

    def item_params
      params[:item].permit(:title, :description, :price, :image_url)
    end
  end
end