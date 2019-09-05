class UsersController < ApplicationController


  before_action :authenticate_user!


  def index
  end

  def show
    begin
      @user = User.friendly.find(params[:id])
    rescue
      @user = User.find(params[:id])
    end
    unless current_user.id == @user.id
     flash[:error] = "You can't go to other user's profile!!"
     redirect_to user_path(current_user)
    end
    @orders = @user.orders
  end

  def new
  end

  def create

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

  def destroy
  end


  private

  def user_params
    params[:user].permit(:first_name, :last_name, :description)
  end
end
