class AddPolymorphicToPicture < ActiveRecord::Migration[7.0]
  def change
    remove_reference :pictures, :user, foreign_key: true, null: false
    add_reference :pictures, :picturable, polymorphic: true, index: true
  end
end
