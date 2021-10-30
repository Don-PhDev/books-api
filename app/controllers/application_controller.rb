class ApplicationController < ActionController::API
  class AuthenticationError < StandardError; end

  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from AuthenticationError, with: :handle_unauthenticated

  private

  def parameter_missing(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def handle_unauthenticated
    head :unauthorized
  end
end
