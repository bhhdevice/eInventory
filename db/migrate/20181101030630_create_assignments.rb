class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :user, null: false
      t.bigint :equipment_id, null: false

      t.timestamps
    end
    add_index :assignments, :equipment_id, unique: true
  end
end
