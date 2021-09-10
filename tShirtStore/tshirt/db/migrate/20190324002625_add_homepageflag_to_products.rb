class AddHomepageflagToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :homepageflag, :boolean
  end
end
