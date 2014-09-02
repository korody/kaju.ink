class ClippingsController < ApplicationController
  respond_to :html, :json

  before_filter :authenticate, except: [:index, :show]
  
  def index
    if params[:type].present?
      @clippings = Clipping.filter(params).order(created_at: :desc)
    elsif params[:query].present?
      @clippings = Clipping.text_search(params[:query])
      if @clippings.empty?
        redirect_to :back, notice: "uhmm! kaju.ink is yet to appear in <strong>#{params[:query]}</strong>".html_safe
      end
    else
      @clippings = Clipping.order(created_at: :desc)
    end
  end

  def show
    @clipping = Clipping.find(params[:id])
  end

  def new
    @clipping = Clipping.new
  end

  def create
    @clipping = Clipping.create(clipping_params)
    thumbnails = Thumbnail.all
    clipping_thumbnails = thumbnails.where(id: @clipping.thumbnails_ids.split(','))
    @clipping.thumbnails << clipping_thumbnails
    attachments = Attachment.all
    clipping_attachments = attachments.where(id: @clipping.attachments_ids.split(','))
    @clipping.attachments << clipping_attachments
    respond_with(@clipping) do |format|
      format.html { redirect_to edit_clipping_path(@clipping) }
    end
  end

  def edit
    @clipping = Clipping.find(params[:id])
    render :new
  end

  def update
    @clipping = Clipping.find(params[:id])
    @clipping.attributes = clipping_params
    thumbnails = Thumbnail.all
    clipping_thumbnails = thumbnails.where(id: @clipping.thumbnails_ids.split(','))
    @clipping.thumbnails << clipping_thumbnails
    attachments = Attachment.all
    clipping_attachments = attachments.where(id: @clipping.attachments_ids.split(','))
    @clipping.attachments << clipping_attachments
    if @clipping.update(clipping_params)
      redirect_to edit_clipping_path(@clipping), success: "Clipping atualizado com sucesso."
    end
  end

  def destroy
    Clipping.find(params[:id]).destroy
    redirect_to admin_path
  end

  private 

  def clipping_params
    params.require(:clipping).permit(:link, :title, :type, :video, :website, :country, :date, :description, :thumbnails_ids, :attachments_ids, :thumbnails_attributes, :attachments_attributes)
  end
end