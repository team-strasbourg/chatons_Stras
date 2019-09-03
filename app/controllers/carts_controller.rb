class CartsController < ApplicationController

  before_action :authenticate_user! 

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


end
