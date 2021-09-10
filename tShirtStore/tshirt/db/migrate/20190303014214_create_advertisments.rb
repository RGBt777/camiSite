class CreateAdvertisments < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisments do |t|
      t.string :title
      t.text :description
      t.string :imagepath
      t.date :startdate
      t.date :enddate

      t.timestamps
    end
  end
end
