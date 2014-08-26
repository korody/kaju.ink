class AttachmentsController < ApplicationController
  respond_to :html, :js
    
  before_filter :authenticate, except: [:index, :show]

  def create
    @attachment = Attachment.create(attachment_params)
  end
    
  def update
    @attachment = Attachment.find(params[:id])
    @attachment.update_attributes(attachment_params)
    respond_with @attachment
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    respond_with(@attachment)
  end

  private

  def attachment_params
    params.require(:attachment).permit(:image, :attachable_type)
  end
end