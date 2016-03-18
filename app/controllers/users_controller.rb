class UsersController < ApplicationController
  before_filter :restrict_access

  def show
    @user = User.find_by(username: params[:user])
    render json: @user
  end

  def current
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(user_id: token)
    end
  end
end
