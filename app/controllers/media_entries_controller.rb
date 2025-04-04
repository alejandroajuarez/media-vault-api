class MediaEntriesController < ApplicationController
  def index
    @media_entries = MediaEntry.all
    render :index
  end
  
  def show
    @media_entry = MediaEntry.find_by(id: params[:id])
    render :show
  end
  
  def create
    @media_entry = MediaEntry.new(
      title: params[:title],
      description: params[:description],
      media_type: params[:media_type],
      image_url: params[:image_url],
      creator: params[:creator]
    )
    if @media_entry.save
      render :show
    else
      render json: { errors: @media_entry.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @media_entry = MediaEntry.find_by(id: params[:id])
    @media_entry.title = params[:title]              || @media_entry.title
    @media_entry.description = params[:description]  || @media_entry.description
    @media_entry.media_type = params[:media_type]    || @media_entry.media_type
    @media_entry.image_url = params[:image_url]      || @media_entry.image_url
    @media_entry.creator = params[:creator]          || @media_entry.creator

    if @media_entry.save!
      render :show
    else
      render json: { errors: @media_entry.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    media_entry = MediaEntry.find_by(id: params[:id])
    media_entry.destroy
    render json: { message: "Entry has been deleted" }
  end
end
