class CartsController < ApplicationController

  before_action :authenticate_user! 

  def index

  end

  def show
    @items = current_user.cart.items 

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

  end

end
