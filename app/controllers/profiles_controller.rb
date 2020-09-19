class ProfilesController < ApplicationController
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
      render "new"
    else
      @sex = Sex.find(@current_user_profile.sex_id)
      @blood_type = BloodType.find(@current_user_profile.blood_type_id)
      @address = Address.find(@current_user_profile.address_id)
      @occupation = Occupation.find(@current_user_profile.occupation_id)
    end
  end

  def edit
    @current_user_profile = Profile.find_by(user_id: current_user.id)
  end

  def update
    @profile = Profile.new(profile_params)
    Profile.find(params[:id]).update(profile_params)
    redirect_to root_path
  end
  
  private

  def profile_params
    params.require(:profile).permit(
      :family_name, :given_name, :family_name_kana, :given_name_kana, :sex_id, :blood_type_id, :birth_day, :address_id, :occupation_id, :work_place, :summary
    ).merge(user_id: current_user.id)
  end

end
