class ChargesController < ApplicationController

  def new
    @amount = Order.find(params[order_id]).total_price
  end

  def create
    # Amount in cents
    @amount = ((Order.find(params[:order_id]).total_price) * 100).to_i

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
   redirect_to user_path(current_user)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
