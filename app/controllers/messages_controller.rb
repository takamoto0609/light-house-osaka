class MessagesController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @message = Message.new
  end

  def creates
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
