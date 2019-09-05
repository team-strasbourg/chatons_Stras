module Admin
  class UsersController < ApplicationController
    before_action :only_admin


    def index
      @users = User.all.sort_by{|user| user.admin ? 0 : 1}
    end

    def show
      @user = User.friendly.find(params[:id])
      @orders = @user.orders
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(email: params[:user][:email], password: params[:user][:password])
      if @user.save
        Cart.create(user: @user)
        flash[:success]='User created'
        redirect_to admin_root_path
      else
        redirect_to new_admin_user_path
      end
    end

    def edit
      @user = User.friendly.find(params[:id])
    end

    def update
      @user = User.friendly.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_root_path
      else
        render 'edit'
      end
    end

    def destroy
      @user = User.find(params[:id])

      if @user.admin != true
        @user.destroy
        flash[:success] = "User successfully deleted"
      else
        flash[:error] = "You can't destroy a admin user"
      end
      redirect_to admin_users_path
    end


    private

    def user_params
      params[:user].permit(:first_name, :last_name, :description, :admin)
    end

    def only_admin
      unless user_signed_in? && current_user.admin == true
        flash[:danger] = 'You\'re not allowed on this page'
        redirect_to root_path
      end
    end


  end
end
