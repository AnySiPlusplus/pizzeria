class CreateFillings < ActiveRecord::Migration[7.0]
  def change
    create_table :fillings do |t|
      t.text :name
      t.monetize :price, null: false, currrency: { present: false }

      t.timestamps
    end
  end
end
