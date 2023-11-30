class AddColumnToZone < ActiveRecord::Migration[7.1]
  def change
    add_column :zones, :position, :string
    add_column :zones, :orientation, :string
    add_column :zones, :point, :string
  end
end
