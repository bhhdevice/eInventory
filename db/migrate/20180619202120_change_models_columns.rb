class ChangeModelsColumns < ActiveRecord::Migration[5.2]
  def self.up
    change_column :models, :wifi, 'boolean USING CAST(wifi AS boolean)'
    change_column :models, :gps, 'boolean USING CAST(gps AS boolean)'
    change_column :models, :bluetooth, 'boolean USING CAST(bluetooth AS boolean)'
  end

  def self.down
    change_column :models, :wifi, :string
    change_column :models, :gps, :string
    change_column :models, :bluetooth, :string
  end
end
