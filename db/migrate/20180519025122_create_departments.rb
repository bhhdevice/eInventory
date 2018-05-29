class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.string :cost_center, null: false

      t.timestamps
    end
    add_index :departments, [:name, :cost_center], unique: true
  end
end
