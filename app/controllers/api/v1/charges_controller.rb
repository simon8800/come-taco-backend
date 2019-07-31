class Api::V1::ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 2500

    customer = Stripe::Customer.create(
      :email => 'dummy@test.com',
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :custoner => customer.idea,
      :amount => @amount,
      :description => 'Dummy test',
      :currency => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
