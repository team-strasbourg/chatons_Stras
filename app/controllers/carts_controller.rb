class CartsController < ApplicationController

  before_action :authenticate_user! 

  def index

  end

  def show
    @cart = Cart.find(params[:id])
    unless current_user.cart.id == @cart.id
      flash[:error] = "You can't go to other user's cart!!"
      redirect_to user_path(current_user)
    end
    @items = Hash.new(0)
    current_user.cart.items.each do |item|
      @items[item] += 1
    end
    @total_quantity = @cart.items.count
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
