class MentorsController < ApplicationController
  before_action :basic_auth
  before_action :search_profile

  def index
  end

  # メンターとして承認する
  def mentor_approval
    @users = User.all
  end

  def mentor_user
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

  def rooms_list_up
  end

  def profiles_list_up
    @profiles = Profile.all
    set_profile_column
    set_sex_column
    set_blood_type_column
    set_address_column
    set_occupation_column
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
  
  def set_sex_column
    @sex_name = Sex.select("name").distinct
  end
  def set_blood_type_column
    @blood_type_name = BloodType.select("name").distinct
  end
  def set_adddress_column
    @adddress_name = Address.select("name").distinct
  end
  def set_occupation_column
    @occupation_name = Occupation.select("name").distinct
  end
end
