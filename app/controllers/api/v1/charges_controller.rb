class Api::V1::ChargesController < ApplicationController
    def create
        puts 'Hi'
    end

    private

    def charge_params
        params.permit(:name, :amount)
    end
end
