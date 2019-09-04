module Admin
  class UsersController < ApplicationController


    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
      @orders = @user.orders
    end

    def new
      @user = User.new
    end

    def create

    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render 'edit'
      end
    end

    def destroy
      User.destroy(params[:id])
      flash[:success] = "User successfully deleted"
      redirect_to admin_users_path
    end


    private

    def user_params
      params[:user].permit(:first_name, :last_name, :description)
    end


  end
end
