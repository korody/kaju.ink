class JobsController < ApplicationController
  def index
    if params[:type].present?
      @jobs = Job.filter(params).order('jobs.created_at DESC')
    else
      @jobs = Job.art.scoped.order('jobs.created_at DESC')
    end
    # @jobs = eval("#{params[:controller].classify}.order(:title)")
    respond_to do |format|
      format.html {  }
      format.js
    end
  end

  def show
    @job = Job.find(params[:id])
    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.js
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(params[:job])
    # if @job.save
    #   flash[:success] = 'job created successfully'
    #   redirect_to @job
    # else
    #   flash.now[:error] = 'job could not be created'
    #   render 'new'
    # end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      redirect_to @job, notice: "Successfully updated job."
    else
      render action: 'edit'
    end
  end

  def destroy
    Job.find(params[:id]).destroy
    redirect_to jobs_url
  end

  # def random
  #   @random = Job.offset(rand(Job.count)).first
  #   respond_to do |format|
  #     format.html {  }
  #     format.js
  #   end
  # end
end