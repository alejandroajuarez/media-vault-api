class SavedMediaController < ApplicationController

  def index
    @saved_media = SavedMedia.where(user_id: current_user.id)
    render :index
  end

  def show
    @saved_medium = SavedMedium.find_by(id: params[:id])
    if @saved_medium
      render :show
    else
      render json: { error: "Not found" }, status: :not_found
    end    
  end

  def create
    
  end
end
