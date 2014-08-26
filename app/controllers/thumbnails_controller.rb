class ThumbnailsController < ApplicationController
  respond_to :html, :js
    
  before_filter :authenticate, except: [:index, :show]

  def create
    @thumbnail = Thumbnail.create(thumbnail_params)
  end
    
  def update
    @thumbnail = Thumbnail.find(params[:id])
    @thumbnail.update_attributes(thumbnail_params)
    respond_with(@thumbnail)
  end

  def destroy
    @thumbnail = Thumbnail.find(params[:id])
    @thumbnail.destroy
    respond_with(@thumbnail)
  end

  private

  def thumbnail_params
    params.require(:thumbnail).permit(:thumb, :thumbable_type)
  end
end