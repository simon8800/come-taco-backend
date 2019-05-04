# frozen_string_literal: true

class ItemSerializer < ActiveModel::Serializer
  # has_many :orders
  # has_many :users, through: :orders
  attributes :id, :name, :description, :price
end
