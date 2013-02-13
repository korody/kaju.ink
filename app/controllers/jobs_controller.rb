class JobsController < ApplicationController

  def index
    @jobs = Job.scoped
    if params[:type].present?
      @jobs = Job.filter(params).order('jobs.created_at DESC')
    else
      @jobs = Job.art.scoped.order('jobs.created_at DESC')
    end
  end

  def show
    @job = Job.find(params[:id])
    @client = @job.client
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
    redirect_to :back
  end

  # def random
  #   @random = Job.offset(rand(Job.count)).first
    # respond_to do |format|
    #   format.html {  }
    #   format.js
    # end
  # end
end