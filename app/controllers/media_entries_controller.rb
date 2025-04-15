class MediaEntriesController < ApplicationController
  # Remove :index from the before_action so it's public;
  # keep authentication for create, update, destroy.
  before_action :authenticate_user, only: [:create, :update, :destroy]

  def index
    if current_user
      # For logged-in users, exclude media they've already saved.
      @media_entries = MediaEntry.where.not(id: current_user.saved_media.select(:media_entry_id))
    else
      # For non-logged in users, show all media entries.
      @media_entries = MediaEntry.all
    end
    render :index
  end

  def show
    @media_entry = MediaEntry.find_by(id: params[:id])
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
      render :show
    else
      render json: { errors: @media_entry.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @media_entry = MediaEntry.find_by(id: params[:id])
    if @media_entry
      @media_entry.title       = params[:title]       || @media_entry.title
      @media_entry.description = params[:description] || @media_entry.description
      @media_entry.media_type  = params[:media_type]  || @media_entry.media_type
      @media_entry.image_url   = params[:image_url]   || @media_entry.image_url
      @media_entry.creator     = params[:creator]     || @media_entry.creator
      @media_entry.save
      render :show
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