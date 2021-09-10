class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :productname
      t.integer :productimage
      t.text :description
      t.string :color
      t.string :size
      t.string :subcategory1
      t.float :saleprice
      t.string :status
      t.float :purchaseprice
      t.integer :qtyonhand
      t.integer :reorderpoint
      t.integer :reorderqty

      t.timestamps
    end
  end
end
