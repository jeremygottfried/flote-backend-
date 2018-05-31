class RealTimeTypingChannel < ApplicationCable::Channel

  def subscribed
    # @user = User.find_by(username: params[:username])
    # @channel = Channel.find_or_create_by(id: params[:room])
    # @user.channels << @channel
    stream_from "edit_#{params[:room]}"

  end

  def unsubscribe

  end

  def receive(data)

    # @user = User.find_by(username: params['username'])
    # @channel = Channel.find_or_create_by(id: params[:room])

    # @note = Note.find(data:id])
    # if @note
        # @note_data = {user: @user, body: data["note"], channel: @channel}
puts data["body"]
      data["note_type"] = "note"
      ActionCable.server.broadcast "#{data["room"]}", data
    # else
    #   ActionCable.server.broadcast "note_#{params[:room]}", {message_type: "note_error", errors: @note.errors, notice: "errors", status: :unprocessable_entity}
    # end
  end
end
