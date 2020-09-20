class MentorsController < ApplicationController
  before_action :basic_auth

  def index
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'mentor' && password == '0000'
    end
  end
end
