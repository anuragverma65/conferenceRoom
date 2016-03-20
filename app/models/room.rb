class Room < ActiveRecord::Base
  has_many :bookings
  scope :active, -> { includes(:bookings).where("(bookings.start NOT IN ? AND bookings.end NOT IN ?)", Booking.start, Booking.end).references(:bookings) }
end
