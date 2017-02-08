class AddPositionToPhasesAndTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :phases, :position, :integer
    add_column :tasks, :position, :integer
  end
end
