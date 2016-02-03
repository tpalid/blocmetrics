class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :passowrd_salt, :password_salt
  end
end
