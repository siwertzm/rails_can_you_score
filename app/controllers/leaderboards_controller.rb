class LeaderboardsController < ApplicationController
  def index
    if params[:zone_id].present?
      @best_trainings = filtered_trainings.sort_by do |training|
        -shooting_efficiency(training)
      end
    else
      @best_trainings = Training.all.sort_by do |training|
        -shooting_efficiency(training)
      end
    end
  end


   def index_filtered
     @best_trainings = filtered_trainings.sort_by do |training|
      -shooting_efficiency(training)
     end

     render :index_filtered
   end

  private

  def filtered_trainings
    if params[:zone_id].present? && params[:zone_id] != ""
      Training.where(zone_id: params[:zone_id])
    else
      Training.all
    end
  end

  def shooting_efficiency(training)
    return 0 if training.shot_total.zero?

    (training.shot_made.to_f / training.shot_total) * 100
   end
end
