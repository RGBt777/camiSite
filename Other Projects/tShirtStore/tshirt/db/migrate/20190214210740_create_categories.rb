class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :categoryname
      t.text :description

      t.timestamps
    end
  end
end
