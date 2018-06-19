class ChangeBrandsColumns < ActiveRecord::Migration[5.2]
  def self.up
    add_column :brands, :email, :string, unique: true
    change_column :brands, :address, :string, null: true
    change_column :brands, :state, :string, null: true
    change_column :brands, :city, :string, null: true
    change_column :brands, :zip_code, :string, null: true
    change_column :brands, :phone_number, :string, null: true
    change_column :brands, :website, :string, null: true
    remove_index :brands, [:name, :address]
    add_index :brands, :name, unique: true
    add_index :brands, :email, unique: true
  end

  def self.down
    remove_column :brands, :email
    change_column :brands, :address, :string, null: false
    change_column :brands, :state, :string, null: false
    change_column :brands, :city, :string, null: false
    change_column :brands, :zip_code, :string, null: false
    change_column :brands, :phone_number, :string, null: false
    change_column :brands, :website, :string, null: false
    remove_index :brands, :name
    remove_index :brands, :email
    add_index :brands, [:name, :address], unique: true
  end

end
