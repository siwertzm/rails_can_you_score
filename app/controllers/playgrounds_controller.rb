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
end
