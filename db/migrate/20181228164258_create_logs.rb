class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :processed_by, array: true, default: []
      t.string :past_user, array: true, default: []
      t.string :past_record, array: true, default: []

      t.timestamps
    end
  end
end
