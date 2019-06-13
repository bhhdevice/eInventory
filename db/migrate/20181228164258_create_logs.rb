class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :processed_by, null: false
      t.string :past_user
      t.string :past_record, array: true, default: [], null: false

      t.timestamps
    end
  end
end
