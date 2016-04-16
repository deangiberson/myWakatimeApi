class UsersController < ApplicationController

  def show
    get_user

    if !@user
      render_not_found
    elsif has_access?
      render_user
    else
      forbidden
    end
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

end
