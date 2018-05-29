class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false, limit: 2
      t.string :zip_code, null: false, limit: 5
      t.string :phone_number, null: false

      t.timestamps
    end
    add_index :locations, :name, unique: true
  end
end
