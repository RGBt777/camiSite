class CreateSaledetails < ActiveRecord::Migration[5.1]
  def change
    create_table :saledetails do |t|
      t.integer :sale_id
      t.integer :product_id
      t.float :saleprice
      t.integer :prodqty

      t.timestamps
    end
  end
end
