class AttachmentsController < ApplicationController
    
  before_filter :the_job
  
  def index
    @attachments = Attachment.where("attachable_id = ?", the_job)
  end


  def show
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attachment }
    end
  end


  def new
    @attachment = Attachment.new
  end


  def create
    @attachment = @job.attachments.create(params[:attachment])
  end


  def destroy
    Attachment.find(params[:id]).destroy
  end

  private 

  def the_job
    @job = Job.find(params["job_id"])
  end
end
