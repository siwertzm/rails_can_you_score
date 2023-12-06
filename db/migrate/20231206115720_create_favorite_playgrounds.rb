class CreateFavoritePlaygrounds < ActiveRecord::Migration[7.1]
  def change
    create_table :favorite_playgrounds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :playground, null: false, foreign_key: true

      t.timestamps
    end
  end
end
