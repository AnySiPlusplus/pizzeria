class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string :name, null: false
      t.string :time, null: false
      t.monetize :price, null: false

      t.timestamps
    end
  end
end
