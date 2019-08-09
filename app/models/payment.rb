class Payment < ApplicationRecord
  belongs_to :order, validate: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_create :unique_id

 private

 def unique_id
   existing_payment = "not_nil"
  while existing_payment
    random_id = SecureRandom.uuid
    existing_payment = Payment.find_by(id: random_id)
  end
  self.id = random_id
 end
end
