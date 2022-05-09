class RoomBookingsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @room_booking = RoomBooking.new(room_booking_params)
    if @room_booking.save
      flash[:notice] = "予約が完了しました"
      redirect_to room_registrations_path
    else
      flash[:notice] = "予約が失敗しました"
      redirect_to room_registrations_path
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

  private

  def room_booking_params
    params.require(:room_booking).permit(:start_date, :end_date, :number_of_people).merge(user_id: current_user.id, room_registration_id: params[:room_booking][:room_registration_id])
  end

end
