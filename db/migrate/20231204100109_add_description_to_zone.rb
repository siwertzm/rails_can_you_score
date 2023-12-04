class AddDescriptionToZone < ActiveRecord::Migration[7.1]
  def change
    add_column :zones, :description, :string
  end
end
