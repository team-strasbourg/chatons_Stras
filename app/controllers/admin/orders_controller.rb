module Admin
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    def index
      @orders = Order.all
    end

    def show
      @order = Order.find(params[:id])

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
      @order = Order.find(params[:id])
      @order.destroy
      flash[:success] = "Your order has been deleted!"
      redirect_to root_path
    end
  end
end