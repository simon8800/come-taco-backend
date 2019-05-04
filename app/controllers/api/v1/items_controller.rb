# frozen_string_literal: true

class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all

    render json: @items
  end

  def show
    @item = Item.find(params[:id])

    render json: @item
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  private

  def item_params
    params.permit(:name, :description, :price)
  end
end
