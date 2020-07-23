class Api::V1::ChargesController < ApplicationController

    def taxes(total)
        return total * 0.0875
    end

    def grand_total
        total = 0
        current_user.items.each do |item|
            total += item.price
        end 
        grand = total + taxes(total)
        return grand.round(2).to_s
    end

    def payment_intent
        grandTotal = grand_total.gsub /\D/, ""
        intent = Stripe::PaymentIntent.create({
            amount: grandTotal.to_i,
            currency: 'usd',
            metadata: {integration_check: 'accept_a_payment'},
        })
        
        if intent
            render json: intent
        else
            render json: {error: 'Failed to create payment'}
        end
    end

    private

    def charge_params
        params.permit(:name, :amount)
    end
end
