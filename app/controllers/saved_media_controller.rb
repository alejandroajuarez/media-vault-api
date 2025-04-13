class SavedMediaController < ApplicationController
  before_action :authenticate_user

  def index
    @saved_media = current_user.saved_media.includes(:media_entry)
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

  def update
    @saved_medium = SavedMedium.find_by(id: params[:id])
    if @saved_medium
      @saved_medium.media_status = params[:media_status] || @saved_medium.media_status
      @saved_medium.rating = params[:rating]             || @saved_medium.rating
      @saved_medium.progress = params[:progress]         || @saved_medium.progress
      @saved_medium.favorite = params[:favorite]         || @saved_medium.favorite
      @saved_medium.save
      render :show
    else
      render json: { error: "Not found or not authorized" }, status: :not_found
    end
  end

  def destroy
    @saved_medium = SavedMedium.find_by(id: params[:id])
    if @saved_medium
      @saved_medium.destroy
      render json: { message: "Entry has been deleted" }
    else
      render json: { error: "Not found or not authorized" }, status: :not_found
    end
  end
end