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
    @jobs = Job.scoped.order('jobs.created_at DESC')
  end

end