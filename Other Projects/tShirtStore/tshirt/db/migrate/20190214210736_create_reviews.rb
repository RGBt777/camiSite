class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id
      t.integer :product_id
      t.date :reviewdate
      t.text :comments
      t.integer :rating
      t.string :status

      t.timestamps
    end
  end
end
