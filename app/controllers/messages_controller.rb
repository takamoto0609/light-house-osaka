class MessagesController < ApplicationController
  def index #room_messages_path(room)
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def new
    @message = Message.new
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.save
    # ルームstatus: 0(新規),1(相談中),2(解決済)
    @room.status = 1
    if @message.content == "解決済" || @message.content == "解決済み"
      @room.status = 2
    end
    @room.save
    redirect_to room_messages_path

    # else
    #   @messages = @room.messages.includes(:user)
    #   render :index
    # end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
