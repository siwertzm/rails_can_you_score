class TrainingsController < ApplicationController
  def index
    @trainings = Training.all
  end

  def show
    @training = Training.find(params[:id])
  end

  def create
    @training = Training.new(training_params)
    @training.user = current_user

    if current_user.favorite_playgrounds.present? && params[:training][:use_favorite_playground] == '1'
      favorite_playground = current_user.favorite_playgrounds.first
      @training.playground_id = favorite_playground.playground_id
    end

    if @training.save
      @notif = Notif.new(user: current_user, training: @training)
      @notif.save!
      flash[:notice] = "Session enregistrée avec succès."
      redirect_to new_training_path
    else
      flash[:alert] = "Le nombre de tirs réussis doit être inférieur au nombre total de tirs."
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @training = Training.new
  end

  def destroy
    @training.destroy
    # redirect_to home_path, status: :see_other
  end

  private

  def training_params
    params.require(:training).permit(:shot_made, :shot_total, :zone_id, :playground_id)
  end
end
