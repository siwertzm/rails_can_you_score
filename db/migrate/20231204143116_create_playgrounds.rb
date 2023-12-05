class CreatePlaygrounds < ActiveRecord::Migration[7.1]
  def change
    create_table :playgrounds do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
