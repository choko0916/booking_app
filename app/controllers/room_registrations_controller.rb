class RoomRegistrationsController < ApplicationController
  def index
    @room_registrations = RoomRegistration.all
  end

  def new
    @room_registration = RoomRegistration.new
  end

  def create
    @room_registration = RoomRegistration.new(params.require(:room_registration).permit(:room_name, :room_introduction, :room_price, :room_address, :room_image))
    if @room_registration.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to :room_registrations
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def updated
  end

  def destroy
  end
end
