class CartsController < ApplicationController

  before_action :authenticate_user! 
  before_action :check_other_carts

  def index

  end

  def show
    @cart = current_user.cart
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

  def check_other_carts
  # method who doesn't allow a user_signed_in to check the cart of the other users
    if user_signed_in? != current_user
      flash[:error] = "You can't go to other user's cart!!"
      redirect_to user_path(current_user)
    end
  end


end
