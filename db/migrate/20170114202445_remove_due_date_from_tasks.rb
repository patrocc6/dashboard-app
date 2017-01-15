class RemoveDueDateFromTasks < ActiveRecord::Migration[5.0]
  def change
    change_table :tasks do |t|
      t.remove :due_date
    end
  end
end
