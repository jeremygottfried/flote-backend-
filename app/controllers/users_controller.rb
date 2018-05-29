class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy, :userNotes]
  skip_before_action :authorize_request, only: [:create]

  # GET /users
  # def index
  #   @users = User.all
  #   render json: @users
  # end
  def index
      json = Rails.cache.fetch('users') do
        User.to_json()
      end

      render json: json
    end

  # GET /users/1
  def show

    json = Rails.cache.fetch("user#{params[:id]}") do
      User.where(id:[params[:id]]).to_json()
    end
    render json: json
  end

  def userNotes

    json = Rails.cache.fetch(@current_user.cache_key_with_version) do
      User.where(id:[params[:id].to_i]).includes(:notes).to_json(include: :notes)
    end

    render json: json
  end

  # POST /users
  def create
    byebug
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        if User.find(params[:id])
          @user = User.find(params[:id])
        else
          @user = User.find_by(username: params[:id])
        end
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:username, :name, :password)
    end

end
