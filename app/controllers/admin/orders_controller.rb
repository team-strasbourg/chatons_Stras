module Admin
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    def index
      @orders = Order.all.sort_by{|order| order.paid ? 1 : 0} #SORT BY TRUE FALSE
    end

    def show
      @order = Order.find(params[:id])
      @user = User.find(@order.user_id)

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
      puts "#"*60
      puts params
      @order = Order.find(params[:id])
      unless @order.is_already_paid
        @order.destroy
        flash[:success] = "Your order has been deleted!"
      else
        flash[:error] = 'You can\'t destroy a paid order'
      end
        redirect_to admin_orders_path
    end
  end
end