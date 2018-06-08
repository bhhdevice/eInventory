class UpdateUserTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :active
    add_reference :users, :status
  end
end
