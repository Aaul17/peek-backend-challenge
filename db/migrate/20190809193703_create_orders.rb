class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :description
      t.float :total
      t.float :balance_due

      t.timestamps
    end
  end
end
