class ProfilsController < ApplicationController
  def show
    @profil = User.find_by(id: params[:id])
    @selected_zone_id = @profil.trainings.last.zone_id
  end
end
