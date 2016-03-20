class Booking < ActiveRecord::Base
  belongs_to :room
  validate :holiday_date
  validate :overlaps
  validate :weekend

  def holiday_date
    holiday= Holiday.pluck(:date).reject(&:blank?)
    
    if holiday.include?(self.start.to_date)
      errors.add(:start, "can't book, its a holiday")
    end
  end

  def weekend
  	if self.start.wday==0 || self.start.wday==6 || self.end.wday==0 || self.end.wday==6
  		errors.add(:start, "can't book, its weekend.")
  	end
  end		

  def overlaps
    	Booking.where(room_id: self.room_id).each do |booking|
    		# raise (booking).inspect
    		if start < booking.end && start > booking.start
    			errors.add(:start, "can't book, its an overlapping.")
    		end
    		
    	end
  end

  # def existing_booking
  # 	Booking.find_each do |booking|
  # 			validates :start, inclusion: { in: (Date.new(booking.start)..Date.new(self.start)) }

  # 	end	
  # end

    #   validates :starts_at, :ends_at, :overlap => {
    #   :exclude_edges => ["starts_at", "ends_at"],
    #   :query_options => {:confirmed => nil},
    #   :scope => 'booking_id',
    #   :message_content => 'is already taken in this time',
    #   :message_title => 'Studio '
    # }, on: :update

  # test code for time diff

  # def overlaps?(other)
  #   (self.start - other.end) * (other.start_date - self.end) >= 0
  # end

  # Return a scope for all interval overlapping the given interval, including the given interval itself
  # scope :overlapping, lambda { |booking| {
  #   :conditions => ["id <> ? AND (DATEDIFF(start, ?) * DATEDIFF(?, end)) >= 0", booking.id, booking.end, booking.start]
  # }}

end
