class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.text :measurement_unit
      t.number :daily_target

      t.timestamps
    end
  end
end
