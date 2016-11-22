class UpdateUserTable < ActiveRecord::Migration
  def change
    remove_column :users, :password_digest
    add_column :users, :avatar, :string
  end
end
