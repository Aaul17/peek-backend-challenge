module Mutations
  class CreatePayment < BaseMutation
    argument :amount, Float, required: true
    argument :note, String, required: false
    argument :order_id, ID, required: true

    type Types::PaymentType

    def resolve(amount:, note:"", order_id:)
      Order.find(order_id).update!(
        balance_due: Order.find(order_id).balance_due - amount
      )
      Payment.create!(
        amount: amount,
        note: note,
        order: Order.find(order_id)
      )
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
