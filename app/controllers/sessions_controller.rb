class SessionsController < ApplicationController
  def index
    @sessions = Session.all
  end

  def show
    @session = Session.find(params[:id])
  end

  def create
    @session = Session.new(session_params)
    @session.user = current_user
    if @session.save
      redirect_to session_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @session = Session.new
  end

  def destroy
    @session.destroy
    # redirect_to home_path, status: :see_other
  end

  private

  def session_params
    params.require(:session).permit(:shot_made, :shot_total)
  end
end
