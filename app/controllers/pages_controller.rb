class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user_profile, only: :stats

  def home
    respond_to do |format|
      format.html
      format.svg { render plain: File.read(Rails.root.join('app', 'assets', 'images', 'basketball_court.svg')), content_type: 'image/svg+xml' }
    end

    @best_trainings = Training.all.sort_by { |training| -training.shooting_efficiency }
  end

  def zone_info
    @zone = Zone.find(params[:id])
    render json: { name: @zone.name, description: @zone.description }
  end

  def stats
    set_best_trainings
    set_latest_trainings_for_table
    set_followers_trainings_data
    set_followers_trainings
  end

  def set_user_profile
    @profil = current_user
    redirect_to root_path, alert: 'User not found' unless @profil.present?
  end

  def set_best_trainings
    @best_trainings = @profil.trainings.to_a.sort_by { |training| -training.shooting_efficiency }
  end

  def set_latest_trainings_for_table
    zone_id = params[:zone_id]

    @latest_trainings_for_table = if zone_id
      @profil.trainings
             .where(zone_id: zone_id)
             .select("*, CASE WHEN shot_total > 0 THEN (shot_made::float / shot_total) * 100 ELSE 0 END AS shooting_efficiency")
             .order(created_at: :desc)
    else
      @profil.trainings
             .select("*, CASE WHEN shot_total > 0 THEN (shot_made::float / shot_total) * 100 ELSE 0 END AS shooting_efficiency")
             .order(created_at: :desc)
    end
  end

  def set_followers_trainings_data
    @profil.followees ||= []

    @followers_trainings_data = @profil.followees.map do |follower|
      {
        label: follower.username,
        trainings: set_follower_trainings(follower)
      }
    end
  end

  def set_follower_trainings(follower)
    zone_id = params[:zone_id]

    trainings = if zone_id
      follower.trainings
              .where(zone_id: zone_id)
              .select("*, CASE WHEN shot_total > 0 THEN (shot_made::float / shot_total) * 100 ELSE 0 END AS shooting_efficiency")
              .order(created_at: :desc)
    else
      follower.trainings
              .select("*, CASE WHEN shot_total > 0 THEN (shot_made::float / shot_total) * 100 ELSE 0 END AS shooting_efficiency")
              .order(created_at: :desc)
    end

    trainings.compact || []
  end

  def set_followers_trainings
    @followers_trainings = @profil.followees.flat_map { |follower| set_follower_trainings(follower) }
  end
end
