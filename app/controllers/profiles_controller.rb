class ProfilesController < ApplicationController
  before_action :search_profile

  def index
    @profile = Profile.where(user_id: "current_user.id")
  end

  def new
    @header_title = "プロフィール登録"
    @profile = Profile.new
    # @current_user_profile = Profile.find_by(user_id: current_user.id)
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.valid?
      @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show #モデルに指示をして取得したデータをビューに渡す
    @header_title = "マイプロフィール"
    @current_user_profile = Profile.find_by(user_id: current_user.id)
    if @current_user_profile == nil
      @profile = Profile.new
      render :new
    else
      @sex = Sex.find(@current_user_profile.sex_id)
      @blood_type = BloodType.find(@current_user_profile.blood_type_id)
      @address = Address.find(@current_user_profile.address_id)
      @occupation = Occupation.find(@current_user_profile.occupation_id)
      @zodiac_sign = ZodiacSign.find(@current_user_profile.zodiac_sign_id)
      @age_group = AgeGroup.find(@current_user_profile.age_group_id)
    end
  end

  def edit
    @header_title = "プロフィール編集"
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def update
    @profile = Profile.new(profile_params)
    if @profile.valid?
      Profile.find(params[:id]).update(profile_params)
      redirect_to root_path
    else
      # @profile = Profile.find(params[:id])
      @profile = Profile.find_by(user_id: current_user.id)
      render :edit
    end
  end
  
  def list_up
    @header_title = "プロフィール検索"
    @users = User.all
    @profiles = Profile.all.order(:user_id)
    set_profile_column
  end

  def search
    @header_title = "検索結果"
    @results = @p.result
    @profiles = Profile.all.order(:user_id)
    set_profile_column
  end

  def mentors_list_up
    @header_title = "公認メンターの皆さん"
    @profiles = Profile.all
    # @users = User.all
  end

  private

  def profile_params
    params.require(:profile).permit(
      :family_name, :given_name, :family_name_kana, :given_name_kana, :sex_id, :blood_type_id, :birth_day, :zodiac_sign_id, :age_group_id, :address_id, :occupation_id, :work_place, :summary
    ).merge(user_id: current_user.id)
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
