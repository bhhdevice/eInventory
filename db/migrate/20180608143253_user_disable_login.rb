class UserDisableLogin < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :disable_login, :boolean, default: false
  end
end
