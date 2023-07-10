class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :amount
      t.integer :payment_status, default: 0
      t.integer :order_status, default: 0
      t.date :payment_date
      t.date :delivery_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
