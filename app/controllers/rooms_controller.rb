class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      flash[:success] = "YATTA"
      redirect_to @room
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update_attributes(room_params)
      flash[:success] = "YATTA"
      redirect_to @room
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])

    if @room.destroy!
      flash[:success] = "Room deleted"
      redirect_to rooms_path
    else
      render :show
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :description)
  end
end
