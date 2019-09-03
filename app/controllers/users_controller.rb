class UsersController < ApplicationController

  # BEFORE ACTION!!!!

  def index
  end

  def show
  end

  def new
  end

  def create

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    puts '#' * 60
    puts params
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
    params[:user].permit(:name, :last_name, :description)
  end

end
