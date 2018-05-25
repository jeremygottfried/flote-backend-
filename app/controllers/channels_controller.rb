class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :update, :destroy]

  # GET /channels
  def index
    @channels = Channel.all

    render json: @channels
  end

  # GET /channels/1
  def show
    render json: @channel
  end

  # POST /channels
  def create
    @channel = Channel.new(channel_params)

    if @channel.save
      render json: @channel, status: :created, location: @channel
    else
      render json: @channel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /channels/1
  def update
    if @channel.update(channel_params)
      render json: @channel
    else
      render json: @channel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /channels/1
  def destroy
    @channel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def channel_params
      params.permit(:title)
    end
end

#new user
body: {
  title: "figure out relationships",
  note: {
    user_id: current_user.id,
    body: "I don't know"
  }
}


note:{
  channel: public_channel
  user_id:
  body: "public"
}


notes1:{
  user_id: 1
  body: "whatever"
}


channel{
  notes: [2,3,4]
  users: [Eric, Jeremy]
}

membership: {
  users: []
}


channel{
  notes: [3,4,6]
  users: [Grayson, Jeremy]
}

body: {

}
