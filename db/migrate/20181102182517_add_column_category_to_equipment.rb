class AddColumnCategoryToEquipment < ActiveRecord::Migration[5.2]
  def up
    add_column :equipment, :category_id, :bigint, null: false, default: 0
    change_column :equipment, :category_id, :bigint, default: nil
    add_index :equipment, :category_id
  end

  def down
    remove_column :equipment, :category_id
  end
end
