# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.confirm unless @user.confirmed?
    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: "Facebook")
  end
end
