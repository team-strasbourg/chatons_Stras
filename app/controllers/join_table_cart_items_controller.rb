class JoinTableCartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    jt_cart_item = JoinTableCartItem.new(cart: current_user.cart,
                                         item: Item.find(params[:item_id]))
    if jt_cart_item.save
      respond_to do |format|
        format.html do
          flash[:success] = 'Item added to the cart'
          redirect_to items_path
        end
        format.js {}
      end
    else
      flash[:error] = 'Item has not been added to the cart'
    end

  end

  def destroy
    jtci = JoinTableCartItem.find(params[:id])
    jtci.destroy
    flash[:success] = 'Item deleted'
    redirect_to user_cart_path(current_user, current_user.cart)
  end
end
