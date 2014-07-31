class ClientsController < ApplicationController
  
  before_filter :authenticate, except: [:index, :show]
  
  def index
    if params[:type].present?
      @clients = Client.filter(params).order('clients.created_at DESC')
    elsif params[:query].present?
      @clients = Client.text_search(params[:query])
      if @clients.empty?
        redirect_to :back, notice: "who? we haven't seen <strong>#{params[:query]}</strong> around here...".html_safe
      end  
    else
      @clients = Client.scoped.order('clients.created_at DESC')
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    # @job = Job.find(params[:job_id])
    @client = Client.new
  end

  def create
    @client = Client.create(params[:client])
    if @client.save
      redirect_to :back
    else
      render 'new'
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update_attributes!(params[:client])
    respond_to do |format|
      format.html { redirect_to edit_client_path(@client) }
      format.js 
    end
  end

  def destroy
    Client.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def client_params
    params.require(:client).permit(:name, :type, :job_id, :thumbnails_attributes)
  end
end