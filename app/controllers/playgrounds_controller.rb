class PlaygroundsController < ApplicationController
  def index
    @playgrounds = Playground.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @playgrounds.geocoded.map do |playground|
      {
        lat: playground.latitude,
        lng: playground.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { playground: playground }, class: "shadow"),
        marker_html: if playground == current_user.favorite_playgrounds.first.playground
                       render_to_string(partial: "markerfavorite")
                     else
                       render_to_string(partial: "marker")
                     end
      }
    end
  end

  def show
    @playground = Playground.find(params[:id])
    @playground_leaderboard = calculate_playground_leaderboard(@playground)
  end

  private

  def calculate_playground_leaderboard(playground)
    filtered_trainings = get_filtered_trainings(playground)

    best_trainings = filtered_trainings.sort_by do |training|
      -shooting_efficiency(training)
    end

    # Return the calculated leaderboard information
    best_trainings
  end

  def get_filtered_trainings(playground)
    if params[:zone_id].present?
      playground.trainings.where(zone_id: params[:zone_id])
    else
      playground.trainings
    end
  end

  def shooting_efficiency(training)
    return 0 if training.shot_total.zero?

    (training.shot_made.to_f / training.shot_total) * 100
  end
end
