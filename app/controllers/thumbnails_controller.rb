class ThumbnailsController < ApplicationController
    
  before_filter :what_job
  before_filter :authenticate, except: [:index, :show]
  
  def index
    @thumbnails = Thumbnail.where("thumbable_id = ?", what_job)
  end


  def show
    @thumbnail = Thumbnail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json
    end
  end


  def new
    @thumbnail = Thumbnail.new
  end


  def create
    @thumbnail = @job.thumbnails.create(params[:thumbnail])
  end


  def destroy
    Thumbnail.find(params[:id]).destroy
  end

  private 

  def what_job
    @job = Job.find(params["job_id"])
  end

  def thumbnail_params
    params.require(:thumbnail).permit(:thumb)
  end
end