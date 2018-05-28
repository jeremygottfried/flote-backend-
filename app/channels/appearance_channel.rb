class AppearanceChannel < ApplicationCable::Channel


  def subscribed
    # @user = User.find_by(username: params[:username])
    # @channel = Channel.find_or_create_by(id: params[:room])
    # @user.channels << @channel

    stream_from "online_#{params[:room]}"


    data['user'] = params['username']
    data['status'] = 'online'
      ActionCable.server.broadcast "online_#{params[:room]}", data
  end

  def unsubscribe
    data['user'] = params['username']
    data['status'] = 'offline'
      ActionCable.server.broadcast "online_#{params[:room]}", data
  end

  def receive(data)
  end



end
