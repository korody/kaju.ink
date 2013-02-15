class ProductsController < ApplicationController

  # before_filter :from_job
  before_filter :authenticate, except: [:index, :show]
  
  def index
    if params[:type].present?
      @products = Product.filter(params).order("RANDOM()")
    else
      @products = Product.scoped.order("RANDOM()")
    end
    respond_to do |format|
      format.html {  }
      format.js
    end
  end


  def show
    @job = Job.find(params[:job_id])
    @product = Product.find(params[:id])
  end


  def new
    @job = Job.find(params[:job_id])
    @product = @job.products.new
  end


  def create
    @job = Job.find(params[:job_id])
    @product = @job.products.create(params[:product])
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end


  def edit
    @product = Product.find(params[:id])
  end


  def update
    @product = Product.find(params[:id])
    @product.update_attributes!(params[:product])
  end


  def destroy
    Product.find(params[:id]).destroy
    redirect_to :back
  end

  private 

  def from_job
    @job = Job.find(params["job_id"])
  end
end
