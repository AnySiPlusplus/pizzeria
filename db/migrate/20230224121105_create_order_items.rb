class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.monetize :price, null: false, currrency: { present: false }
      t.integer :quantity, default: 1
      t.references :pizza, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
