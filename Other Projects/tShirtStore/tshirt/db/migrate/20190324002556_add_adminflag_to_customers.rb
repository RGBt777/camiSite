class AddAdminflagToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :adminflag, :boolean
  end
end
