class CreateTrandetails < ActiveRecord::Migration[5.1]
  def change
    create_table :trandetails do |t|
      t.integer :transaction_id
      t.integer :product_id
      t.string :saleprice
      t.integer :prodqty

      t.timestamps
    end
  end
end
