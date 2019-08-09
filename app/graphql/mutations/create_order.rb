module Mutations
  class CreateOrder < BaseMutation
    argument :description, String, required: true
    argument :total, Float, required: true
    argument :balance_due, Float, required: false

    type Types::OrderType

    def resolve(description:, total:, balance_due:nil)
      Order.create!(
        description: description,
        total: total,
        balance_due: total
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
