class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false, limit: 80
      t.text :review_text, null: false, limit: 500
      t.integer :rating, default: 0
      t.integer :status
      t.references :pizza, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
