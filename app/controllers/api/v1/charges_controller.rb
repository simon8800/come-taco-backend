require 'stripe'
require 'securerandom'

# check charge_params
class Api::V1::ChargesController < ApplicationController
    skip_before_action :authorized
    def create
        Stripe.api_key = 'sk_test_636dxyrekTAzI7X1deoEMYdM005sDg5Dbu'
        ip_key = SecureRandom.uuid
        begin
            customer = Stripe::Customer.create({
                :email => current_user.email,
                :source => params[:charge][:token]
            })
            puts customer
            charge = Stripe::Charge.create({
                :customer => customer.id,
                :amount => params[:charge][:amount],
                :currency => params[:charge][:currency]
            }, {
                :idempotency_key => ip_key
            })
            puts charge
        rescue Stripe::CardError => e
            render json: {message: 'Unable to process charge'}, status: :not_acceptable
        end 
    end



    private

    def charge_params
        params.permit(:amount, :source, :token)
    end

end
