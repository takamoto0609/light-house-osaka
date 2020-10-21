class RoomsController < ApplicationController
  before_action :detect_devise_variant

  def index
    @header_title = "アプリの説明書"
    @user = User.find_by(id: current_user.id)
    # @user.mentor = 1
    # @user.save
  end

  def new
    @header_title = "相談ルーム作成"
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to 
    else
      render :home
    end
  end

  def edit
    @header_title = "ルーム編集"
    @room = Room.find_by(id: params[:id])
    get_room_user
  end

  def update
    @room = Room.new(room_params)
    if @room.valid?
      Room.find(params[:id]).update(room_params)
      redirect_to room_messages_path(params[:id])
    else
      @room = Room.find_by(id: params[:id])
      render :edit
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

  def library
    @header_title = "ライブラリ"
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