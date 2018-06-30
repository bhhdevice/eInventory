class AddColumnNumbersToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :models, :number, :string
    add_index :models, :number
  end
end
