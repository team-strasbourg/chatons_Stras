class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
    unless current_user.cart.items.empty?
      @order = Order.new(user: current_user)
      if @order.save
        fill_order
        empty_cart
        flash[:success] = "Order created"
        redirect_to order_path(@order.id)
      else
        flash[:error] = "Order failed to be created"
         redirect_to root_path
      end
    else 
      redirect_to root_path
     
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
