class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :companyname
      t.string :pointofcontact
      t.string :website
      t.string :phone

      t.timestamps
    end
  end
end
