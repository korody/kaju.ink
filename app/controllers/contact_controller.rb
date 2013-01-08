class ContactController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      flash[:success] = 'Thank you! I will contact you as soon as possible!'
      redirect_to hello_path
    else
      render 'new'
    end
  end
end
