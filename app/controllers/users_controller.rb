class UsersController < ApplicationController
  before_filter :restrict_access

  def show
    @user = User.find_by(username: params[:user])
    if same_user?
      render_user
    else
      head :unauthorized
    end
  end

  def current
    @user = @api_key.user
    render_user
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      @api_key = ApiKey.find_by(access_token: token)
    end
  end

  def same_user?
    @user == @api_key.user
  end

  def render_user
    render json: {data: @user}
  end
end
