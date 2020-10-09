class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :before_action_of_side_bar
  # before_action :go_home

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name,:given_name,:family_name_kana,:given_name_kana])
  end

  def before_action_of_side_bar
    @rooms = Room.all.order(:status).order(id: "DESC")
  end

  def go_home
    if user_signed_in?
      redirect_to home_rooms_path
    else
      redirect_to log_in_rooms_path
    end
  end
end
