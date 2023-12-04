class NotifsController < ApplicationController
  def destroy
    @notif = Notif.find(params[:id])
    @notif.destroy
    redirect_to root_path
  end
end
