class CreatePizzaFillings < ActiveRecord::Migration[7.0]
  def change
    create_table :pizza_fillings do |t|
      t.references :pizza, null: false, foreign_key: true
      t.references :filling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
