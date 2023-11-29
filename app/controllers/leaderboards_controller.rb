class LeaderboardsController < ApplicationController
  def index
    @best_trainings = Training.all.sort_by do |training|
      -training.shooting_efficiency
    end
  end

  private

  def shooting_efficiency
    return 0 if shot_total.zero?

    (shot_made.to_f / shot_total) * 100
  end
end
