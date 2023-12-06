class PlaygroundsController < ApplicationController
  def index
    @playgrounds = Playground.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @playgrounds.geocoded.map do |playground|
      {
        lat: playground.latitude,
        lng: playground.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { playground: playground }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @playground = Playground.find(params[:id])
    @playground_leaderboard = calculate_playground_leaderboard(@playground)
  end

  def calculate_playground_leaderboard(playground)
  # Retrieve the relevant trainings for this playground
  playground_trainings = Training.where(playground_id: playground.id)

  # Calculate leaderboard information based on the retrieved trainings
  leaderboard_info = playground_trainings.map do |training|
    {
      user: training.user,
      zone: training.zone,
      shooting_efficiency: shooting_efficiency(training)
      # Add any other information you want to include in the leaderboard
    }
  end

  # Sort the leaderboard_info by shooting efficiency in descending order
  leaderboard_info.sort_by! { |info| -info[:shooting_efficiency] }

  # Return the calculated leaderboard information
  leaderboard_info
  end
end
