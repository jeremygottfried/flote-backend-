class AuthenticationController < ApplicationController
 skip_before_action :authorize_request

 def authenticate
   @user = User.find_by(username: params[:authentication][:username])
   command = AuthenticateUser.call(params[:authentication][:username], params[:authentication][:password])

   if command.success?
     render json: { auth_token: command.result, user_id: @user.id, username: @user.username }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end

 private

end
