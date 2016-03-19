class UsersController < ApplicationController
  before_filter :restrict_access

  def show
    render json: @user
  end

  def current
    render json: @user
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      @user = User.find_by(user_id: token)
    end
  end
end
