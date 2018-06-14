class AlterZipCodeLimits < ActiveRecord::Migration[5.2]

  def self.down
    change_column :users, :zip_code, :string, limit: 5
    change_column :locations, :zip_code, :string, limit: 5
    change_column :brands, :zip_code, :string, limit: 5
  end

  def self.up
    change_column :users, :zip_code, :string, limit: 10
    change_column :locations, :zip_code, :string, limit: 10
    change_column :brands, :zip_code, :string, limit: 10
  end
end
