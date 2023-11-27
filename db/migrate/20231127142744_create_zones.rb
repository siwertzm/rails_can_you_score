class CreateZones < ActiveRecord::Migration[7.1]
  def change
    create_table :zones do |t|
      t.string :name

      t.timestamps
    end
  end
end
