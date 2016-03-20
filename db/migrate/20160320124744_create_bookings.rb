class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :start
      t.datetime :end
      t.string :user
      t.integer :room_id
      t.string :agenda

      t.timestamps null: false
    end
  end
end
