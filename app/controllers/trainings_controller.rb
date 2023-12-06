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
    if @training.save
      @notif = Notif.new(user: current_user, training: @training)
      @notif.save!
      flash[:notice] = "Session enregistré avec succès."
      redirect_to root_path
    else
      flash[:alert] = "Le nombre de shoot réussit doit etre inférieure au shoot total."
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
    params.require(:training).permit(:shot_made, :shot_total, :zone_id)
  end
end
