class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.references :participant, null: false, foreign_key: true
      t.references :candidate_date, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
