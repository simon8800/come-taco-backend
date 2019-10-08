require 'stripe'
class Api::V1::ChargesController < ApplicationController
    skip_before_action :authorized
    def index
        @items = Charge.all
        render json: @items
    end

    def create
        Stripe.api_key = 'sk_test_636dxyrekTAzI7X1deoEMYdM005sDg5Dbu'
        @item = Charge.create(charge_params)
        user = current_user
        byebug
        begin
            customer = Stripe::Customer.create({
                :email => current_user.email
            })
            charge = Stripe::Charge.create({
                :amount => @item.price,
                :currency => 'usd'
            })
        rescue Stripe::CardError => e
            render json: {message: 'Unable to process charge'}, status: :not_acceptable
        end
    end 

    private

    def charge_params
        params.permit(:user_id, :price, {items: [:id, :name, :price]})
    end
end
