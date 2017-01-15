class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :lead_time
      t.date :due_date
      t.references :phase, foreign_key: true

      t.timestamps
    end
  end
end
