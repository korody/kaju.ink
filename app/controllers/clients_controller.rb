class ClientsController < ApplicationController
  respond_to :html, :json

  before_filter :authenticate, except: [:index, :show]
  
  def index
    if params[:type].present?
      @clients = Client.filter(params).order(created_at: :desc)
    elsif params[:query].present?
      @clients = Client.text_search(params[:query])
      if @clients.empty?
        redirect_to :back, notice: "who? we haven't seen <strong>#{params[:query]}</strong> around here...".html_safe
      end  
    else
      @clients = Client.order(created_at: :desc)
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
    @client = Client.create(client_params)
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
    @client.update_attributes(client_params)
    respond_with @client
  end

  def destroy
    Client.find(params[:id]).destroy
    redirect_to :back
  end

  def autocomplete
    @clients = Client.order(:name)
    respond_with(@client) do |format|
      format.json { render json: @clients.tokens(params[:term]) }
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :type, :job_id, :thumbnails_attributes)
  end
end