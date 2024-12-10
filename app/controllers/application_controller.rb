class ApplicationController < ActionController::API
  def current_user
    return unless request.headers["Authorization"]

    token = request.headers["Authorization"].split(' ').last
    decoded_token = JWT.decode(token, 
                               Rails.application.secret_key_base, 
                               true, {  algorithm: 'HS256' })

    @current_user ||= User.find(decoded_token[0]["user_id"])
    rescue JWT::DecodedError, ActiveRecord::RecordNotFound
  end

  def authenticate_user!
    render json: { error: "Unauthorized" }, status: :unauthorized unless current_user
  end
end
