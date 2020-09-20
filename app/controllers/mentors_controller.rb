class MentorsController < ApplicationController
  before_action :basic_auth

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
  end

  def users_search
  end



  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'mentor' && password == '0000'
    end
  end
end
