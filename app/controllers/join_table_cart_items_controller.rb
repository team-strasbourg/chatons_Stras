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
      respond_to do |format|
        format.html {
          flash[:success] = 'Item added to the cart'
          redirect_to root_path
        }
        format.js { }
      end
    else
      flash[:error] = 'Item has not been added to the cart'
    end

  end

  def edit
  end

  def update
  end

  def destroy
    jtci = JoinTableCartItem.find(params[:id])
    jtci.destroy
    flash[:success] = 'Item deleted'
    redirect_to user_cart_path(current_user, current_user.cart)
  end
end
