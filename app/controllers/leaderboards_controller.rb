class LeaderboardsController < ApplicationController
  def index
    @profiles = filtered_trainings.sort_by do |user|
      if params[:zone_id].present? && params[:zone_id] != ""
        -user.average_shooting_efficiency_by_zone(params[:zone_id])
      else
        -user.average_shooting_efficiency
      end
    end
  end

  def filtered_trainings
    if params[:zone_id].present? && params[:zone_id] != "" && params[:username].present? && params[:username] != ""
      User.joins(:trainings).where(trainings: { zone_id: params[:zone_id] }).where("username LIKE ?", "%#{params[:username]}%").distinct
    elsif params[:username].present? && params[:username] != ""
      User.where("username LIKE ?", "%#{params[:username]}%")
    elsif params[:zone_id].present? && params[:zone_id] != ""
      User.joins(:trainings).where(trainings: { zone_id: params[:zone_id] }).distinct
    else
      User.all
    end
  end
end
