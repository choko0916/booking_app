class RoomBookingsController < ApplicationController
  def index
    @room_bookings = RoomBooking.all
    @user = current_user
  end

  def create
    @room_booking = RoomBooking.new(room_booking_params)
    if @room_booking.save
      flash[:notice] = "予約が完了しました"
      redirect_to room_registrations_path
    else
      flash[:notice] = "予約が失敗しました"
      render "new"
    end
  end

  def show
    @room_booking = RoomBooking.find(params[:id])
  end

  def edit
    @room_booking = RoomBooking.find(params[:id])
  end

  private

  def room_booking_params
    params.require(:room_booking).permit(:start_date, :end_date, :number_of_people).merge(user_id: current_user.id, room_registration_id: params[:room_booking][:room_registration_id])
  end

end
