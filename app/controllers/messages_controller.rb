class MessagesController < ApplicationController
  def index #room_messages_path(room)
    @header_title = "相談中..."
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
    get_room_user
  end

  def new
    @message = Message.new
  end

  def create
    get_room_user
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.valid?
      @message.save
      # ルームstatus: 0(新規),1(相談中),2(解決済)
      @room.status = 1
      if @message.content == "解決済" || @message.content == "解決済み"
        @room.status = 2
      elsif @message.content == "再開"
        @room.status = 1
      end
      @room.save
      redirect_to room_messages_path
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

  def get_room_user
    @super_rooms = Room.joins(:user).order(:status).order(user_id: "ASC")
    .select("
      rooms.id,
      rooms.name,
      content,
      status,
      user_id,
      users.family_name AS user_family_name,
      users.given_name AS user_given_name
      ")
  end
end
