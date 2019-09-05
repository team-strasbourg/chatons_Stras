module Admin
  class AvatarsController < ApplicationController
    before_action :only_admin
    def new
      @item = User.find(params[:item_id])
    end

    def create

      @item = Item.find(params[:item_id])
      # Identify the item connected

      @item.avatar.attach(params[:avatar])
      # We attached to it the avatar

      redirect_to admin_items_path

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
