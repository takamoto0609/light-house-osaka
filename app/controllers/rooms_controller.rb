class RoomsController < ApplicationController
  def index
    @header_title = "ライブラリ"
  end

  def new
    @header_title = "新規ルーム作成"
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def home
    @header_title = "ホーム"
    unless user_signed_in?
      render "rooms/log_in"
    end
  end

  def log_in
  end

  def list_up
    @header_title = "相談ルーム"
  end

  private

  def room_params
    params.require(:room).permit(:name, :content).merge(user_id: current_user.id)
  end

end