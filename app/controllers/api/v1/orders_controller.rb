# frozen_string_literal: true

class Api::V1::OrdersController < ApplicationController
  skip_before_action :authorized

  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    @order = Order.find(params[:id])
    render json: @order
  end

  def create
    @order = Order.create(order_params)
    if @order.valid?
      render json: @order
    else
      render json: { error: 'failed to create order' }, status: :not_acceptable
    end
  end

  def destroy
    @order = Order.find_by(order_params)
    @order.destroy
  end


  private

  def order_params
    params.permit(:id, :user_id, :item_id)
  end
end
