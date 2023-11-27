class CreateTrainings < ActiveRecord::Migration[7.1]
  def change
    create_table :trainings do |t|
      t.integer :shot_made
      t.integer :shot_total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
