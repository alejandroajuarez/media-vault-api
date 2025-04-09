class SavedMediaController < ApplicationController

  def index
    @saved_media = SavedMedium.all
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
    @saved_medium = SavedMedium.new(
      media_status: params[:media_status],
      rating: params[:rating],
      progress: params[:progress],
      favorite: params[:favorite],
      user_id: current_user.id,
      media_entry_id: params[:media_entry_id]
    )
    if @saved_medium.save!
      render :show
    else
      render json: { errors: @saved_medium.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
