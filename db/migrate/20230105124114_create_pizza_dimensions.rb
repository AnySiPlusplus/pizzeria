class CreatePizzaDimensions < ActiveRecord::Migration[7.0]
  def change
    create_table :pizza_dimensions do |t|
      t.float :dimension, null: false, limit: 50
      t.monetize :price, null: false, currrency: { present: false }

      t.timestamps
    end
  end
end
