class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messges.include(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @messages = @room.message.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private message_params
    params.require(:message).permit(:content).
  end

end