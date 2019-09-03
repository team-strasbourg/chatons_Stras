class CartsController < ApplicationController

  before_action :authenticate_user! 

  def index

  end

  def show
    @items = current_user.cart.items 
    total_price
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

  def total_price
    # Calculate total price of items in cart
    current_user.cart.items.sum(:price)

  end

end
