class JoinTableCartItemsController < ApplicationController
   before_action :authenticate_user!

  def index
  end

  def show
  end

  def new

  end

  def create
    jt_cart_item = JoinTableCartItem.new(cart: current_user.cart, item: Item.find(params[:item_id]))
    if jt_cart_item.save
      flash[:success] = "Item added to the cart"
    else
      flash[:error] = "Item has not been added to the cart"
      puts jt_cart_item.errors.messages
    end
    redirect_to item_path(params[:item_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
