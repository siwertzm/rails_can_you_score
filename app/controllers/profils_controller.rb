class ProfilsController < ApplicationController

  def show
    @profil = User.find_by(id: params[:id])
  end

  def leaderboard
    @top_users = User.order(shooting_efficiency: :desc).limit(10)
  end

end
