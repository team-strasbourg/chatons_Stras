class CartsController < ApplicationController

  before_action :authenticate_user! 
  # before_action :check_other_carts

  def index

  end

  def show
    # @cart = current_user.cart
    @cart = Cart.find(params[:id])
    unless current_user.cart.id == @cart.id
     flash[:error] = "You can't go to other user's cart!!"
     redirect_to user_path(current_user)
    end

    @items = current_user.cart.items 
    @total_price = @cart.total_price
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


  private
end
