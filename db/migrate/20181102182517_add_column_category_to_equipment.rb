class AddColumnCategoryToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :category_id, :bigint
    add_index :equipment, :category_id
  end
end
