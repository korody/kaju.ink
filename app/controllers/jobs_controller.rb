class JobsController < ApplicationController

  before_filter :authenticate, except: [:index, :show, :random]
  
  def index
    if params[:type].present?
      @jobs = Job.filter(params).order("RANDOM()")
    else
      @jobs = Job.art.scoped.order("RANDOM()")
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
    @job = Job.create(params[:job])
    @client = @job.client
    respond_to do |format|
      format.html { redirect_to edit_job_path(@job) }
      format.js 
    end
  end

  def edit
    @job = Job.find(params[:id])
    @client = @job.client
    respond_to do |format|
      format.html { render 'new' }
      format.js 
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update_attributes!(params[:job])
    respond_to do |format|
      format.html { redirect_to edit_job_path(@job) }
      format.js 
    end
  end

  def destroy
    Job.find(params[:id]).destroy
    redirect_to art_path
  end

  def random
    @job = Job.offset(rand(Job.count)).first
    @client = @job.client
    @products = @job.products
    respond_to do |format|
      format.html
      format.js { render 'show' }
    end
  end

  def admin
    if params[:query].present?
      @jobs = Job.text_search(params[:query])
      if @jobs.empty?
        redirect_to :back, notice: " couldn't find <strong>#{params[:query]}</strong> honey pie...please try again ; )".html_safe
      end
    else
      @jobs = Job.scoped.order('jobs.created_at DESC')
    end
  end

  private

  def job_params
    params.require(:job).permit(:area, :client_name, :client_info, :description, :effort, :material, :spot, :title, :type, :what, :duration, :website, :video, :attachments_attributes, :thumbnails_attributes, :products_attributes, :client_attributes)
  end
end