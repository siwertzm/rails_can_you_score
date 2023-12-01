class LeaderboardsController < ApplicationController
  def index
    @best_trainings = filtered_trainings.sort_by do |training|
      -shooting_efficiency(training)
    end
  end

  def filtered_trainings
    if params[:zone_id].present? && params[:zone_id] != "" && params[:username].present? && params[:username] != ""
      Training.where(zone_id: params[:zone_id], user_id: User.where("username LIKE ?", "%#{params[:username]}%").ids)
    elsif params[:username].present? && params[:username] != ""
      Training.where(user_id: User.where("username LIKE ?", "%#{params[:username]}%").ids)
    elsif params[:zone_id].present? && params[:zone_id] != ""
      Training.where(zone_id: params[:zone_id])
    else
      Training.all
    end
  end

  def shooting_efficiency(training)
    return 0 if training.shot_total.zero?

    (training.shot_made.to_f / training.shot_total) * 100
  end

  def average_shooting_efficiency(user)
    return 0 if user.trainings.empty?

    total_efficiency.to_i = user.trainings.sum { |training| training.shooting_efficiency }
    total_efficiency.to_i / user.trainings.size
  end
end
