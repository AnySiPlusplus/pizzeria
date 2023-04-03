class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.references :order, null: false, foreign_key: true
      t.string :receiver_name, null: false, limit: 50
      t.string :street, null: false, limit: 50
      t.string :building, null: false, limit: 50
      t.string :city, null: false, limit: 50
      t.string :phone, null: false, limit: 15

      t.timestamps
    end
  end
end
