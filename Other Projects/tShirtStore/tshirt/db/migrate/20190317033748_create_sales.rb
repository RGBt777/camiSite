class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.integer :customer_id
      t.date :saledate
      t.text :salenotes

      t.timestamps
    end
  end
end
