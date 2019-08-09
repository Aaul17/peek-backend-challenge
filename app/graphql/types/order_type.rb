module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :description, String, null: false
    field :total, Float, null: false
    field :balance_due, Float, null: false
    field :payments_applied, [PaymentType], null: false, method: :payments
  end
end
