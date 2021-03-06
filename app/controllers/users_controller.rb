class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.friendly.find(params[:id])
    unless current_user.id == @user.id
      flash[:error] = "You can't go to other user's profile!!"
      redirect_to user_path(current_user)
    end
    @orders = @user.orders
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params[:user].permit(:first_name, :last_name, :description)
  end
end
