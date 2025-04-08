class MediaEntriesController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]
  def index
    @media_entries = MediaEntry.where(user_id: current_user)
    render :index
  end
  
  def show
    @media_entry = current_user.MediaEntry.find_by(id: params[:id])
    if @media_entry
      render :show
    else
      render json: { error: "Not found" }, status: :not_found
    end
  end
  
  def create
    @media_entry = MediaEntry.new(
      title: params[:title],
      description: params[:description],
      media_type: params[:media_type],
      image_url: params[:image_url],
      creator: params[:creator],
      user_id: current_user.id
    )
    if @media_entry.save
      render json: :show
    else
      render json: { errors: @media_entry.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @media_entry = MediaEntry.find_by(id: params[:id])
    if @media_entry
      @media_entry.title = params[:title]              || @media_entry.title
      @media_entry.description = params[:description]  || @media_entry.description
      @media_entry.media_type = params[:media_type]    || @media_entry.media_type
      @media_entry.image_url = params[:image_url]      || @media_entry.image_url
      @media_entry.creator = params[:creator]          || @media_entry.creator
      @media_entry.save
      render json: :show
    else
      render json: { error: "Not found or not authorized" }, status: :not_found
    end
  end

  def destroy
    @media_entry = MediaEntry.find_by(id: params[:id])
    if @media_entry
      @media_entry.destroy
      render json: { message: "Entry has been deleted" }
    else
      render json: { error: "Not found or not authorized" }, status: :not_found
    end
  end
end
