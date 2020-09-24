class MentorsController < ApplicationController
  before_action :basic_auth
  before_action :search_profile

  def index
    @header_title = "管理者用画面"
  end

  # メンターとして承認する
  def mentor_approval
    @header_title = "メンター・ユーザー切り替え"
    @users = User.all
  end

  def mentor_user
    @header_title = "メンター・ユーザー切り替え"
    @users = User.all
    @user = User.find_by(id: params[:format])
    if @user.mentor == 0
      @user.mentor = 1
    elsif @user.mentor == 1
      @user.mentor = 0
    end
    @user.save
    render "mentor_approval"
  end

  def new_rooms
    @header_title = "新規ルーム一覧"
    @rooms = Room.all.order(:status).order(user_id: "ASC")
  end

  def all_rooms
    @header_title = "全ルーム一覧"
    @rooms = Room.all.order(:status).order(user_id: "ASC")
  end

  def all_profiles
    @header_title = "全プロフィール一覧"
    @profiles = Profile.all
    set_profile_column
  end

  def users_search
    @results = @p.result.includes(:sex, :blood_type, :address, :occupation)
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["LHO_BASIC_AUTH_USER"] && password == ENV["LHO_BASIC_AUTH_PASSWORD"]
    end
  end

  def search_profile
    @p = Profile.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_profile_column
    @profile_family_name = Profile.select("family_name").distinct  # 重複なくnameカラムのデータを取り出す
    @profile_given_name = Profile.select("given_name").distinct
    @profile_family_name_kana = Profile.select("family_name_kana").distinct
    @profile_given_name_kana = Profile.select("given_name_kana").distinct
    @profile_birth_day = Profile.select("birth_day").distinct
  end
  
end
