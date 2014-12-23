class ExitsController < ApplicationController

  def new
    @room = Room.find(params[:room_id])
    @exit = RoomExit.new
  end

  def create
    @room = Room.find(params[:room_id])
    @room_exit = RoomExit.new(exit_params)

    if @room_exit.save!
      flash[:success] = "YATTA"
      redirect_to @room
    else
      render :new
    end
  end

  private

  def exit_params
    params.require(:room_exit).permit(:trigger, :description, :origin_room_id, :destination_room_id)
  end
end

