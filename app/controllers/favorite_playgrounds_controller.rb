class FavoritePlaygroundsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.favorite_playgrounds.destroy_all

    @favorite_playground = FavoritePlayground.new(playground_id: params[:favorite_playground][:playground_id], user: current_user)

  if @favorite_playground.save
    respond_to do |format|
      format.html { redirect_to playgrounds_path, notice: 'Terrain mis en favori.' }
      format.js   # Render create.js.erb or create.js.haml
    end
  else
    respond_to do |format|
      format.html { redirect_to root_path, alert: 'Failed to add playground to favorites.' }
      format.js   # Render create.js.erb or create.js.haml
    end
  end
  end

  def destroy
    favorite_playground = FavoritePlayground.find_by(playground_id: params[:id], user: current_user)
    favorite_playground.destroy
    redirect_to root_path, notice: 'Playground removed from favorites.'
  end

  def add_to_favorites
    @playground = Playground.find(params[:playground_id])
    favorite = current_user.favorite_playgrounds.create(playground: @playground)

    if favorite.persisted?
      puts "Added Playground ##{params[:playground_id]} to favorites for User ##{current_user.id}"
    else
      puts "Failed to add Playground ##{params[:playground_id]} to favorites for User ##{current_user.id}"
    end

    respond_to do |format|
      format.js { render js: "console.log('Added to favorites');" }
    end
  end
end
