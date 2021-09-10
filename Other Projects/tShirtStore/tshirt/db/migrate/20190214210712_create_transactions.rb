class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.string :saledate
      t.text :salesnotes

      t.timestamps
    end
  end
end
