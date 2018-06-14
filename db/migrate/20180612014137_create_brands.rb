class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :state, null: false, limit: 2
      t.string :city, null: false
      t.string :zip_code, null: false, limit: 5
      t.string :phone_number, null: false
      t.string :website, null: false

      t.timestamps
    end
    add_index :brands, [:name, :address], unique: true
  end
end
