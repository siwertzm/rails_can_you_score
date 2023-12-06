class AddUseFavoritePlaygroundToTrainings < ActiveRecord::Migration[7.1]
  def change
    add_column :trainings, :use_favorite_playground, :boolean
  end
end
