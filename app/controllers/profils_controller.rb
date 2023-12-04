class ProfilsController < ApplicationController
  def show
    @profil = User.find(params[:id])
    @best_trainings = @profil.trainings
                        .select("*, CASE WHEN shot_total > 0 THEN (shot_made::float / shot_total) * 100 ELSE 0 END AS shooting_efficiency")
                        .order('shooting_efficiency DESC')
                        .limit(3)
    @selected_zone_id = @profil.trainings.last&.zone_id
  end

  def follow
    @profil = User.find(params[:id])
    Follow.create(follower: current_user, followed: @profil)
    redirect_to profil_path(@profil)
  end

  def unfollow
    @profil = User.find(params[:id])
    Follow.find_by(follower: current_user, followed: @profil).destroy
    redirect_to profil_path(@profil)
  end

  def shooting_efficiency(training)
    return 0 if training.shot_total.zero?

    (training.shot_made.to_f / training.shot_total) * 100
  end

  def best_user_trainings(profil, number_of_trainings)
    best_trainings = profil.trainings.limit(number_of_trainings).sort_by do |training|
      -shooting_efficiency(training)
    end
    puts "Best Trainings: #{best_trainings.inspect}"
    best_trainings
  end

  def average_shooting_efficiency(user)
    return 0 if user.trainings.empty?

    total_efficiency = user.trainings.sum { |training| shooting_efficiency(training) }
    total_efficiency.to_f / user.trainings.size
  end
end
