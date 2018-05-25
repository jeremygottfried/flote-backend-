class AuthenticationController < ApplicationController
 skip_before_action :authorize_request

 def authenticate
   @user = User.find_by(username: params[:authentication][:username])
   command = AuthenticateUser.call(params[:authentication][:username], params[:authentication][:password])

   if command.success?
     render json: { token: command.result, username: @user.username, user_id: @user.id }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end

 def register
   @user = User.new(username: params[:authentication][:username], name: params[:authentication][:name], password: params[:authentication][:password])
   if @user.save
     command = AuthenticateUser.call(params[:username], params[:password])
     if command.success?
       render json: { token: command.result, username: @user.username, user_id: @user.id }
     end
   else
     render json: { error: command.errors }, status: :unauthorized
   end
  end
 end
