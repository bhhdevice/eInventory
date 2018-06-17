class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :models do |t|
      t.string :name, null: false
      t.datetime :release_date, null: false
      t.references :brand, null: false
      t.references :category, null: false
      t.string :processor
      t.string :ram
      t.string :storage_capacity
      t.string :storage_type
      t.string :display
      t.string :battery_capacity
      t.string :wifi
      t.string :bluetooth
      t.string :gps
      t.string :cellular
      t.string :camera
      t.string :size
      t.string :weight

      t.timestamps
    end
    add_index :models, :name, unique: true
    add_index :models, :release_date
  end
end
