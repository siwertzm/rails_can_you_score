class AddPlaygroundToTrainings < ActiveRecord::Migration[7.1]
  def change
    add_reference :trainings, :playground, foreign_key: true, index: true, null: true
  end
end
