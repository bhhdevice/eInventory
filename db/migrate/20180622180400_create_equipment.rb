class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.references :brand, null: false
      t.references :model, null: false
      t.string :asset_tag, limit: 6
      t.string :hostname
      t.string :serial_number
      t.string :phone_number
      t.string :sim_number, limit: 20
      t.string :imei, limit: 15
      t.string :device_number, limit: 15

      t.timestamps
    end
    add_index :equipment, :asset_tag
    add_index :equipment, :serial_number
    add_index :equipment, :phone_number
    add_index :equipment, :sim_number
    add_index :equipment, :imei
    add_index :equipment, :device_number
  end
end
