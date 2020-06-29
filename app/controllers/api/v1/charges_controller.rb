class Api::V1::ChargesController < ApplicationController
    skip_before_action :authorized

    def create
        @charge = Charge.create(charge_params)
        byebug
    end

    private

    def charge_params
        params.permit(:name, :amount)
    end
end
