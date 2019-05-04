# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  # has_many :orders
  # has_many :items, through: :orders
  attributes :id, :first_name, :last_name, :email
end
