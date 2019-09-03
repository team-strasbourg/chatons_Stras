class UsersController < ApplicationController
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
  end

  def destroy
  end
end
