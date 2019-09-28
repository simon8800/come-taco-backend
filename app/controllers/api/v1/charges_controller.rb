require 'stripe'
class Api::V1::ChargesController < ApplicationController
    skip_before_action :authorized

    def create
        # Stripe.api_key = 'pk_test_OHsp793zkjWWR6rFPeVnf7nR00uGTVDgXk'
        @item = Charge.create(charge_params)
        byebug
    end 

    private

    def charge_params
        params.permit(:user_id, :price, :items)
    end
end
