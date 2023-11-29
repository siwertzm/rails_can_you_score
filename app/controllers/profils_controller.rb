class ProfilsController < ApplicationController
  def show
    @profil = User.find_by(id: params[:id])
  end
end
