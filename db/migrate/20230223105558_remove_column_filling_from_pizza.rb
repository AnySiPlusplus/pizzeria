class RemoveColumnFillingFromPizza < ActiveRecord::Migration[7.0]
  def change
    remove_column :pizzas, :filling, null: false
    add_reference :pizzas, :fillings, foreign_key: true
  end
end
