class ChangeIntegerLimitInYourTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :daily_target, :integer, limit: 8
  end
end
