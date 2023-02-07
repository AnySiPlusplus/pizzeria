class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :first_name, null: false, limit: 50
      t.string :last_name, null: false, limit: 50
      t.string :address, null: false, limit: 50
      t.string :city, null: false, limit: 50
      t.string :country, null: false, limit: 50
      t.string :phone, null: false, limit: 15
      t.references :user, null: false, foreign_key: true
      t.string :type, null: false, limit: 50

      t.timestamps
    end
  end
end
