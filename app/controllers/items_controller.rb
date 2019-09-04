class ItemsController < ApplicationController
  def index

    @items = Item.all
    # REDIRECTION TO THE ADMIN ROOT IF ADMIN
    if user_signed_in? && current_user.admin == true
      redirect_to admin_root_path
    end

  end

  def show
    @item = Item.find(params[:id])
    if user_signed_in?
      @cart = current_user.cart
    end
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
  end
end
