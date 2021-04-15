class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.float :running
      t.float :reading
      t.float :coding
      t.float :project
      t.float :movie
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
