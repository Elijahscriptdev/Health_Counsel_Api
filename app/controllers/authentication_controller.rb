class AuthenticationController < ApplicationController
  # return auth token once user is authenticated
  skip_before_action :authorize_request, only: :authenticate

  # def authenticate
  #   auth_token =
  #     AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
  #   json_response(auth_token: auth_token)
  # end

  def authenticate
    if User.find_by(email: auth_params[:email])
      auth_token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    end
    if Doctor.find_by(email: auth_params[:email])
      auth_token =
        AuthenticateDoctor.new(auth_params[:email], auth_params[:password]).call
    end
    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
