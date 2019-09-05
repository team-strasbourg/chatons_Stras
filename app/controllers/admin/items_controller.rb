# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
    before_action :only_admin
    def index
      @items = Item.all.sort_by(&:id)
    end

    def show
      @item = Item.friendly.find(params[:id])
    end

    def new
      @item = Item.new
    end

    def create
      my_params=params[:item]
      @item = Item.new(title: my_params[:title],
                       description: my_params[:description],
                       price: my_params[:price],
                       image_url: my_params[:image_url],
                       avatar: my_params[:avatar])
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
      @item = Item.friendly.find(params[:id])
      @item.destroy
      flash[:success] = 'Item successfully deleted'
      redirect_to admin_items_path
    end

    private

    def item_params
      params[:item].permit(:title, :description, :price, :image_url, :avatar)
    end

    def only_admin
      unless user_signed_in? && current_user.admin == true
        flash[:danger] = 'You\'re not allowed on this page'
        redirect_to items_path
      end
    end
  end
end