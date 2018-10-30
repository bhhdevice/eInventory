class CreateStock < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :item, polymorphic: true, null: false
      t.references :category
      t.integer :total, null: false, default: 0
      t.integer :available, null: false, default: 0
      t.integer :in_use, null: false, default: 0

      t.timestamps
    end
  end
end
