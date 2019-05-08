# frozen_string_literal: true

class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :item_id
end
