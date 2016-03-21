class HolidaysController < ApplicationController
  def index
  		@holidays= Holiday.all
  end
  def new
  end
  def show
    @holiday = Holiday.find(params[:id])
    # render plain: @holiday.inspect

  end
    def create
	  @holiday = Holiday.new(params.require(:holiday).permit(:date, :reason))
	    # render plain: @holiday.inspect
 # Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
  @holiday.save
  redirect_to @holiday
  end
end
