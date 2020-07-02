require 'stripe'
require 'securerandom'

class Api::V1::PaymentsController < ApplicationController
    skip_before_action :authorized 

    def index
        @items = Payment.all
        render json: @items
    end
    
    def create
        @item = Payment.create(payment_params)
        byebug
        if @item.valid?
            render json: @item
        else
            render json: {error: 'Failed to create payment'}
        end 
    end 

    def payment_intent
        byebug
        @intent = Stripe::PaymentIntent.create({
            amount: payment_params[:price],
            currency: 'usd',
            payment_method_types: ['card']
        })
        
        if @intent.valid?
            render json: @intent
        else
            render json: {error: 'Failed to create Payment Intent'}
        end
    end
    
    private
    # Payment table needs to be fixed, will not allow strong params thru
    # until fixed
    def payment_params
        params.permit(:price)
    end
    # def payment_params
    #     params.permit(:user_id, :price, {items: [:id, :name, :price]})
    # end
end



