class JobsController < ApplicationController
  respond_to :html, :json

  before_filter :authenticate, except: [:index, :show, :random]
  
  def index
    if params[:type].present?
      @jobs = Job.filter(params).order(created_at: :desc)
    else
      @jobs = Job.art.order(created_at: :desc)
    end
  end

  def show
    @job = Job.find(params[:id])
    @client = @job.client
    @products = @job.products
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    thumbnails = Thumbnail.all
    job_thumbnails = thumbnails.where(id: @job.thumbnails_ids.split(','))
    @job.thumbnails << job_thumbnails
    attachments = Attachment.all
    job_attachments = attachments.where(id: @job.attachments_ids.split(','))
    @job.attachments << job_attachments
    @client = @job.client
    respond_with(@job) do |format|
      format.html { redirect_to edit_job_path(@job) }
    end
  end

  def edit
    @job = Job.find(params[:id])
    @client = @job.client
  end

  def update
    @job = Job.find(params[:id])
    @job.update_attributes(job_params)
    respond_with(@job) do |format|
      format.html { redirect_to edit_job_path(@job) }
    end
  end

  def destroy
    Job.find(params[:id]).destroy
    redirect_to admin_path
  end

  def random
    @job = Job.offset(rand(Job.count)).first
    @client = @job.client
    @products = @job.products
    respond_with(@job) do |format|
      format.js { render 'show' }
    end
  end

  private

  def job_params
    params.require(:job).permit(:area, :client_name, :client_info, :description, :material, :spot, :title, :type, :what, :duration, :website, :video, :thumbnails_ids, :attachments_ids, :attachments_attributes, :thumbnails_attributes, :products_attributes, client_attributes: [:id, :name, :type, thumbnails_attributes: [:thumb, :thumbable_id, :thumbable_type]])
  end
end