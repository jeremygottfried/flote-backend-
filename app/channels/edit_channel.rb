class EditChannel < ApplicationCable::Channel

  def subscribed
    # @user = User.find_by(username: params[:username])
    # @channel = Channel.find_or_create_by(id: params[:room])
    # @user.channels << @channel
    stream_from "save_#{params[:room]}"
  end

  def unsubscribe

  end

  def receive(data)
    # @user = User.find_by(username: params['username'])
    # @channel = Channel.find_or_create_by(id: params[:room])
    # @note_data = {user: @user, body: data["note"], channel: @channel}

    @note = Note.find(data['id'])
    @note.body = data["note"]
    if @note.save
      data["note_type"] = "note"
      data["id"] = @note.id
      data["body"] = @note.body
      data["user"] = params['username']
      ActionCable.server.broadcast "save_#{params[:room]}", data
    else
      ActionCable.server.broadcast "save_#{params[:room]}", {message_type: "note_error", errors: @note.errors, notice: "errors", status: :unprocessable_entity}
    end
  end
end
