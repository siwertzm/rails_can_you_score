class AddShortnameToPlaygrounds < ActiveRecord::Migration[7.1]
  def change
    add_column :playgrounds, :short_name, :string
  end
end
