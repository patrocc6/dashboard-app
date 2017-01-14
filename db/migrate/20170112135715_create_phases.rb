class CreatePhases < ActiveRecord::Migration[5.0]
  def change
    create_table :phases do |t|
      t.text :name
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
