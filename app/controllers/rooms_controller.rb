class RoomsController < ApplicationController
  def new
  end
  def index
    @rooms = Room.all
  end

  def book
    @room = Room.find(params[:id])
  end

  def create
	  @room = Room.new(params.require(:room).permit(:name, :size))
 
  @room.save
  redirect_to @room
  end
  
  def show
    @room = Room.find(params[:id])

  end
end
