class Api::V1::AuthenticationController < ApplicationController
  def create
    raise AuthenticationError unless user.authenticate(params.require(:password))
    token = AuthenticationTokenService.call(user.id)

    render json: { token: token }, status: :created
  end

  private

  def user
    @user ||= User.find_by(email: params.require(:email))
  end
end
