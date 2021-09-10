class AddUsernamePasswordDigestToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :username, :string
    add_column :customers, :password_digest, :string
  end
end
