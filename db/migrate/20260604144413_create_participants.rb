class CreateParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :participants do |t|
      t.references :event, null: false, foreign_key: true
      t.string :name
      t.text :memo

      t.timestamps
    end
  end
end
