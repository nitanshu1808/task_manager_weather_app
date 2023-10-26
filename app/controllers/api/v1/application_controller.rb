module Api
  module V1
    class ApplicationController < ActionController::API
      include ActionController::MimeResponds

      before_action :authorize_request

      def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          decoded = JsonWebToken.decode(header)
          @current_user = User.find(decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { errors: e.message }, status: :unauthorized
        end
      end

      def not_found
        render json: { error: 'not_found' }, status: :unauthorized
      end
    end
  end
end