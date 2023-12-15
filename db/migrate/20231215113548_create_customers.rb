class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.integer :first_payment_delay, null: true
      t.integer :payment_day, null: true
      t.timestamps
    end
  end
end
