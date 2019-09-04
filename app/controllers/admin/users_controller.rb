module Admin
  class UsersController < ApplicationController


    def index
      @users = User.all.sort_by{|user| user.admin ? 0 : 1}
    end

    def show
      @user = User.find(params[:id])
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
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_root_path
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
      params[:user].permit(:first_name, :last_name, :description, :admin)
    end


  end
end
