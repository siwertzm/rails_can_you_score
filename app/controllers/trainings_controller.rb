class TrainingsController < ApplicationController
  def index
    @trainings = Training.all
  end

  def show
    @trainings = Training.find(params[:id])
  end

  def create
    @training = Training.new(training_params)
    @training.user = current_user
    if @training.save
      redirect_to new_training_path
    else
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
