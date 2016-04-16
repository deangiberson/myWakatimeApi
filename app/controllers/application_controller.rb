class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :restrict_access

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      @api_key = ApiKey.find_by(access_token: token)
    end
  end

  def has_access?
    same_user?
  end

  def same_user?
    @user == @api_key.user
  end

  def get_user
    username = params[:user_id] || params[:id]

    if username == 'current'
      @user = @api_key.user
    else
      if /@[-0-9a-zA-Z]+/.match username
        username.sub!(/^@/, '')
        @user = User.find_by(username: username)
      end
    end
  end

  def render_not_found
    render json: {
             error: "Not found"
           }
  end

  def forbidden
    render json: {
             error: "Forbidden"
           }
  end

end
