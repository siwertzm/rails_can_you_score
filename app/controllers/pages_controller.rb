class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    respond_to do |format|
      format.html
      format.svg { render plain: File.read(Rails.root.join('app', 'assets', 'images', 'basketball_court.svg')), content_type: 'image/svg+xml' }
    end

    @trainings = Training.all
  end

  def stats
    @user = current_user
    @best_trainings = @user.trainings.to_a.sort_by { |training| -training.shooting_efficiency }
    # Add more stats as needed
  end
end
