class NoteChannel < ApplicationCable::Channel

  def subscribed
    @user = User.find_by(username: params[:username])
    @channel = Channel.find_or_create_by(id: params[:room])
    @user.channels << @channel
    stream_from "note_#{params[:room]}"

  end

  def unsubscribe

  end

  def receive(data)

    @user = User.find_by(username: params['username'])
    @channel = Channel.find_or_create_by(id: params[:room])
    @note_data = {user: @user, body: data["note"], channel: @channel}

    @note = Note.new(@note_data)
    if @note.valid?
      @note.save
      data["note_type"] = "note"
      data["id"] = @note.id
      data["body"] = @note.body
      ActionCable.server.broadcast "note_#{params[:room]}", data
    else
      ActionCable.server.broadcast "note_#{params[:room]}", {message_type: "note_error", errors: @note.errors, notice: "errors", status: :unprocessable_entity}
    end
  end
end
