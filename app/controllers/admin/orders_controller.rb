# frozen_string_literal: true

module Admin
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :only_admin
    def index
      @orders = Order.all.sort_by{|order| order.paid ? 1 : 0} #SORT BY TRUE FALSE
    end

    def show
      @order = Order.find(params[:id])
      @user = User.find(@order.user_id)

    end

    def destroy
      @order = Order.find(params[:id])
      if @order.is_already_paid
        flash[:error] = 'You can\'t destroy a paid order'
      else
        @order.destroy
        flash[:success] = 'Your order has been deleted!'
      end
      redirect_to admin_orders_path
    end

    private 

    def only_admin
      unless user_signed_in? && current_user.admin == true
        flash[:danger] = 'You\'re not allowed on this page'
        redirect_to items_path
      end
    end
  end
end