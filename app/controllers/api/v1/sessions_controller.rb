module Api
  module V1
    class SessionsController < ApplicationController
      def new 
      end

      def create
        user = User.find_by(email: params[:session][:email].downcase,
                            username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
          token = generate_token(user)
          session[:user_id] = user.id
          render json: { message: "Logged in successfully", data: user, token: token}
        else
          # Rails.logger.error("Invalid Login Attempt: #{params[:session]}")
          render json: { error: "Invalid Credentials"} 
        end
      end

      def destroy
        session[:user_id] = nil
        render json: { message: "Logged Out"}
      end

      private
      
      def generate_token(user)
        payload = { user_id: user.id, exp: 24.hours.from_now.to_i }
        JWT.encode(payload, Rails.application.secret_key_base, 'HS256')
      end
    end
  end
end