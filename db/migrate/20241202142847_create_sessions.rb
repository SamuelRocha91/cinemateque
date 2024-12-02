class CreateSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :sessions do |t|
      t.references :movie, null: false, foreign_key: true
      t.integer :day_of_week
      t.string :hour
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
