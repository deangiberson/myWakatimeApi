class UsersController < ApplicationController
  before_filter :restrict_access

  def show
    @user = get_user
    if has_access?
      render_user
    else
      head :unauthorized
    end
  end

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

  def render_user
    render json: {data:
                    {id: @user.user_id,
                     email: @user.email,
                     timezone: @user.timezone,
                     last_heartbeat: "",
                     last_plugin: "",
                     last_project: "",
                     plan: @user.plan,
                     username: @user.username,
                     profile: {
                       logged_time_public: @user.profile.logged_time_public,
                       languages_used_public: @user.profile.languages_used_public,
                       email_public: @user.profile.email_public,
                       photo_public: @user.profile.photo_public
                     },
                     created_at: @user.created_at,
                     modified_at: @user.updated_at
                    }}
  end

  def get_user
    if params[:id] == 'current'
      @api_key.user
    else
      User.find_by(username: params[:id])
    end
  end
end
