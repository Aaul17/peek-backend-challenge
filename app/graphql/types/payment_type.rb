module Types
  class PaymentType < Types::BaseObject
    field :id, ID, null: false
    field :amount, Float, null: false
    field :note, String, null: false
    field :applied_at, GraphQL::Types::ISO8601DateTime, null: false, method: :created_at
    field :order, OrderType, null: false
  end
end
