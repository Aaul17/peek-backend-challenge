module Types
  class QueryType < Types::BaseObject
    field :all_orders, [OrderType], null: false
    field :all_payments, [PaymentType], null: false

    def all_orders
      Order.all
    end

    def all_payments
      Payment.all
    end
  end
end
