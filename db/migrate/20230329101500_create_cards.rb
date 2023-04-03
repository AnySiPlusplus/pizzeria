class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :card_number, null: false
      t.string :card_name, null: false
      t.string :validity, null: false
      t.integer :cvv, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
