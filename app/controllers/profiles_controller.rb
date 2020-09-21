class ProfilesController < ApplicationController
  before_action :search_profile

  def index
    @profile = Profile.where(user_id: "current_user.id")
  end

  def new
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
    @current_user_profile = Profile.find_by(user_id: current_user.id)
  end

  def update
    @profile = Profile.new(profile_params)
    if @profile.valid?
      Profile.find(params[:id]).update(profile_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def list_up
    @profiles = Profile.all
    set_profile_column
    # set_sex_column
    # set_blood_type_column
    # set_address_column
    # set_occupation_column
  end

  def search
    @results = @p.result
    # .includes(:sex, :blood_type, :zodiac_sign, :age_group, :address, :occupation)
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
  
  # def set_sex_column
  #   @sex_name = Sex.pluck(:name)
  # end
  # def set_blood_type_column
  #   @blood_type_name = BloodType.select("name").distinct
  # end
  # def set_adddress_column
  #   @adddress_name = Address.select("name").distinct
  # end
  # def set_occupation_column
  #   @occupation_name = Occupation.select("name").distinct
  # end

end
