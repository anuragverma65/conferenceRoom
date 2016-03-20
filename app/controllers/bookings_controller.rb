class BookingsController < ApplicationController
	
require 'date'
def new
@room = Room.find(params[:room_id])
end
def index
	@bookings= Booking.where(room_id: params[:room_id])
end	
def create
  @room = Room.find(params[:room_id])
  @booking = Booking.new(params.require(:booking).permit(:start, :end, :room_id, :user))
    # render plain: params[:booking].inspect
  # @bookings= Booking.where(room_id: params[:room_id])
  # where("start< ?", a).where("end > ?",  a)
 # somedate = DateTime.new(params["start(1i)"].to_i, params["start(2i)"].to_i,params["start(3i)"].to_i,params["start(4i)"].to_i,params["start(5i)"].to_i)
    # render plain: somedate.inspect
if @booking.save
  redirect_to room_bookings_path, notice: "Booking created."
else
  render action: 'new'
end


#   if @currentDate > @bookings.start || @currentDate <@bookings.end
# # render plain: "hello"
#   else
#   	 @booking.save
#   end
 
  # redirect_to @booking
end
def show
    @booking = Booking.find(params[:id])
end
end

