class ApplicationController < ActionController::API
  before_action :authorize_request
      attr_reader :current_user

      private

      def authorize_request
        @current_user = AuthorizeApiRequest.call(request.headers).result
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
      end

end
