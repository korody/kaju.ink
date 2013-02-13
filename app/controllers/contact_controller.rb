class ContactController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      flash[:success] = "Thank you! I'll be in touch as soon as possible!"
    else
      respond_to do |format|
        format.html {  }
        format.js
      end
    end
  end
end
