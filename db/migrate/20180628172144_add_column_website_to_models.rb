class AddColumnWebsiteToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :models, :website, :string
  end
end
