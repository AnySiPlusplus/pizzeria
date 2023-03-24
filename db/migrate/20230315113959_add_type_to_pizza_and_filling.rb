class AddTypeToPizzaAndFilling < ActiveRecord::Migration[7.0]
  def change
    add_column :pizzas, :type, :string
    add_column :fillings, :type, :string
  end
end
