class PaymentSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :price, :items
end