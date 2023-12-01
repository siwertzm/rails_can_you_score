class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    respond_to do |format|
      format.html
      format.svg { render plain: File.read(Rails.root.join('app', 'assets', 'images', 'basketball_court.svg')), content_type: 'image/svg+xml' }
    end

    @best_trainings = Training.all.sort_by { |training| -training.shooting_efficiency }
  end

  def stats
    @profil = current_user
    @best_trainings = @profil.trainings.to_a.sort_by { |training| -training.shooting_efficiency }
    if params[:zone_id]
      @latest_trainings_for_table = @profil.trainings
        .where(zone_id: params[:zone_id])
        .select("*, CASE WHEN shot_total > 0 THEN (shot_made::float / shot_total) * 100 ELSE 0 END AS shooting_efficiency")
        .order(created_at: :desc)
    else
      @latest_trainings_for_table = @profil.trainings
        .select("*, CASE WHEN shot_total > 0 THEN (shot_made::float / shot_total) * 100 ELSE 0 END AS shooting_efficiency")
        .order(created_at: :desc)
    end
  end
end
