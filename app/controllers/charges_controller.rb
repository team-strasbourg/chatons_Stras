class ChargesController < ApplicationController

  def new
    @amount = Order.find(params[order_id]).total_price
  end

  def create
    # Amount in cents
    @amount = Order.find(params[order_id]).total_price

    customer = Stripe::Customer.create({
                                           email: params[:stripeEmail],
                                           source: params[:stripeToken],
                                       })

    charge = Stripe::Charge.create({
                                       customer: customer.id,
                                       amount: @amount,
                                       description: 'Rails Stripe customer',
                                       currency: 'usd',
                                   })
    puts "#"*60
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
