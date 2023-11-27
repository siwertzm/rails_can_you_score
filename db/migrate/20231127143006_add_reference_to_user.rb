class AddReferenceToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :sessions, :zone, foreign_key: true
  end
end
