# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @items = Hash.new(0)
    @order.items.each do |item|
      @items[item] += 1
    end
    @total_quantity = @order.items.count
    @total_price = @order.total_price
  end

  def create
    if current_user.cart.items.empty?
      redirect_to items_path
    else
      @order = Order.new(user: current_user)
      if @order.save
        fill_order
        empty_cart
        flash[:success] = 'Order created'
        redirect_to user_order_path(current_user, @order.id)
      else
        flash[:error] = 'Order failed to be created'
        redirect_to items_path
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:success] = 'Your order has been deleted!'
    redirect_to items_path
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
