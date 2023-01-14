class CreatePizzas < ActiveRecord::Migration[7.0]
  def change
    create_table :pizzas do |t|
      t.string :name, null: false
      t.monetize :price, null: false, currrency: { present: false }
      t.text :filling, null: false
      t.text :description, null: false
      t.references :category, null: false, foreign_key: true
      t.references :pizza_dimension, null: false, foreign_key: true

      t.timestamps
    end
  end
end
