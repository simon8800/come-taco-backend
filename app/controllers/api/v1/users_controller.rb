# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  # go to http://localhost:3000/api/v1/users
  
  def index
    @users = User.all

    render json: @users
  end

  def show
    @user = User.find(params[:id])

    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
