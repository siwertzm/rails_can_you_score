class AddColumnToPlaygrounds < ActiveRecord::Migration[7.1]
  def change
    add_column :playgrounds, :court, :string
  end
end
