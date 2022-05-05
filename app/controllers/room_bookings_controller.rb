class RoomBookingsController < ApplicationController
  def index
    @room_registrations = RoomRegistration.all
  end

  def new
    @room_booking = RoomBooking.new
  end

  def create
    @room_booking = RoomBooking.new(params.require(:room_booking).permit(:start_date, :end_date, :number_of_people))
    binding.pry
    if @room_booking.save
      binding.pry
      flash[:notice] = "予約が完了しました"
      redirect_to room_bookings_path
    else
      binding.pry
      flash[:notice] = "予約が失敗しました"
      render new_room_booking_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
