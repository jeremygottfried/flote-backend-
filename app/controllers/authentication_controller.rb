class AuthenticationController < ApplicationController
 skip_before_action :authorize_request

 def authenticate
   command = AuthenticateUser.call(params[:authentication][:username], params[:authentication][:password])

   if command.success?
     render json: { auth_token: command.result }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end

 private

end
