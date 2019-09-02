class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
  end

  def new
  end

  def create
    @order = Order.new(user: current_user)
    if @order.save
      fill_order
      empty_cart
      flash[:success] = "Order created"
      puts "Order created"
    else
      flash[:danger] = "Order failed to be created"
      puts "Order failed to be created"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def fill_order
    current_user.cart.items.each do |item|
      JoinTableOrderItem.create(order: @order, item: item)
    end
  end

  def empty_cart
    JoinTableCartItem.where(cart: current_user.cart).destroy_all
  end
end
