class LeaderboardsController < ApplicationController
  def index
    @profiles = filtered_trainings.sort_by do |user|
      if params[:zone_id].present? && (params[:zone_id] == "20" || params[:zone_id] == "30")
        -user.average_shooting_efficiency_by_group(params[:zone_id])
      elsif params[:zone_id].present? && params[:zone_id] != ""
        -user.average_shooting_efficiency_by_zone(params[:zone_id])
      else
        -user.average_shooting_efficiency
      end
    end
  end

  def filtered_trainings
    if params[:zone_id].present? && params[:zone_id] != "" && params[:username].present? && params[:username] != ""
      if params[:zone_id] == "20" || params[:zone_id] == "30"
        User.joins(:trainings).where(trainings: { zone_id: Zone.where(point: params[:zone_id].to_i / 10).ids }).where("username LIKE ?", "%#{params[:username]}%").distinct
      else
        User.joins(:trainings).where(trainings: { zone_id: params[:zone_id] }).where("username LIKE ?", "%#{params[:username]}%").distinct
      end
    elsif params[:username].present? && params[:username] != ""
      User.where("username LIKE ?", "%#{params[:username]}%")
    elsif params[:zone_id].present? && params[:zone_id] != ""
      if params[:zone_id] == "20" || params[:zone_id] == "30"
        User.joins(:trainings).where(trainings: { zone_id: Zone.where(point: params[:zone_id].to_i / 10).ids }).distinct
      else
        User.joins(:trainings).where(trainings: { zone_id: params[:zone_id] }).distinct
      end
    else
      User.all
    end
  end
end
