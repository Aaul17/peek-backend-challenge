class Order < ApplicationRecord
  has_many :payments, dependent: :destroy
  validates :description, :total, :balance_due, presence: true
  validates :total, :balance_due, numericality: { greater_than_or_equal_to: 0 }

  before_create :unique_id

 private

 def unique_id
   existing_order = "not_nil"
  while existing_order
    random_id = SecureRandom.uuid
    existing_order = Order.find_by(id: random_id)
  end
  self.id = random_id
 end
end
