class ProductsController < ApplicationController
  respond_to :html, :json

  before_filter :authenticate, except: [:index, :show]
  
  def index
    if params[:type].present?
      @products = Product.filter(params).order(created_at: :desc)
    elsif params[:query].present?
      @products = Product.text_search(params[:query])
      if @products.empty?
        redirect_to :back, notice: "oh, no! <strong>#{params[:query]}</strong> seems to be out of stock...".html_safe
      end
    else
      @products = Product.order(created_at: :desc)
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
    @product = @job.products.create(product_params)
    respond_with(@job, @product) do |format|
      format.html { redirect_to :back }
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    respond_with @product
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to :back
  end

  private 

  def product_params
    params.require(:product).permit(:link, :title, :type, thumbnails_attributes: [:thumb, :thumbable_id, :thumbable_type])
  end
end