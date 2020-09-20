class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :before_action_of_side_bar

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def before_action_of_side_bar
    @rooms = Room.all.order(:status).order(id: "DESC")
    # if user_signed_in?
    #   @rooms = @rooms.find_by(user_id: current_user.id)
    # end
  end
end
