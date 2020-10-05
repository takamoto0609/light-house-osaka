class RoomsController < ApplicationController
  before_action :detect_devise_variant

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
    @room = Room.new
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

  def detect_devise_variant
    ua = request.user_agent
    if(ua.include?('Mobile') || ua.include?('Android'))
      request.variant = :mobile
    end
  end

end