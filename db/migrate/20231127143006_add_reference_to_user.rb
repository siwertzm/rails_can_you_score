class AddReferenceToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :trainings, :zone, foreign_key: true
  end
end
