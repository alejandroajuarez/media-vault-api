class MediaEntriesController < ApplicationController
  def index
    @mediaentries = MediaEntry.all
    render :index
  end

  def show
    id_find = find_by[:id]
    @mediaentry = MediaEntry.find_by(id: id_find)
    render :show
  end

  def create
    @mediaentry = MediaEntry.new(
      title: params[:title],
      description: params[:description],
      media_type: params[:media_type],
      image_url: params[:image_url],
      creator: params[:creator]
    )
    if @mediaentry.save
      render :show
    else
      render json: { errors: @mediaentry.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @mediaentry = MediaEntry.find_by(id: params[:id])
    @mediaentry.title = params[:title]              || @mediaentry.title
    @mediaentry.description = params[:description]  || @mediaentry.description
    @mediaentry.media_type = params[:media_type]    || @mediaentry.media_type
    @mediaentry.image_url = params[:image_url]      || @mediaentry.image_url
    @mediaentry.creator = params[:creator]          || @mediaentry.creator

    if @mediaentry.save!
      render :show
    else
      render json: { errors: @mediaentry.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    media_entry = MediaEntry.find_by(id: params[:id])
    media_entry.destroy
    render json: { message: "Entry has been deleted" }
  end
end
