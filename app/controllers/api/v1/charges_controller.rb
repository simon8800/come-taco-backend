class Api::V1::ChargesController < ApplicationController
    skip_before_action :authorized

    def create
        byebug
    end

    private

    def charge_params
        params.permit(:name, :amount)
    end
end
