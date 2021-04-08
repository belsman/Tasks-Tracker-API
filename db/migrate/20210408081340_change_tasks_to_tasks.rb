class ChangeTasksToTasks < ActiveRecord::Migration[6.1]
  def change
    remove_reference :measurements, :tasks, foreign_key: true
    add_reference :measurements, :task, foreign_key: true
  end
end
