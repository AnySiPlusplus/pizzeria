class AddColumnToOrder < ActiveRecord::Migration[7.0]
  def change
    add_monetize :orders, :subtotal, null: false
    add_column :orders, :status, :integer
    add_reference :orders, :delivery, foreign_key: true
    add_column :orders, :completed_at, :datetime
  end
end
