class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    @notes = Note.all

    render json: @notes
  end

  # GET /notes/1
  def show
    render json: @note
  end

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      render json: @note, status: :created, location: @note
      data = {
        "body" => note_params[:body],
        "user_id" => note_params[:user_id],
        "id" => @note.id,
        "act" => 'create',
        "channel_id" => note_params[:channel_id]
      }
      ActionCable.server.broadcast "note_#{note_params[:user_id]}", data
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    data = {
      'act' => 'delete',
      'id' => note_params[:id],
      'index' => note_params[:index]
    }
    ActionCable.server.broadcast "note_#{@note.user.id}", data
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.permit(:body, :id, :user_id, :channel_id, :index)
    end
end
