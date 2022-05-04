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
      redirect_to room_registrations_path
    else
      render :new
    end
  end

  def show
    @room_registration = RoomRegistration.find(params[:id])
  end

  def edit
    @room_registration = RoomRegistration.find(params[:id])
  end

  def updated
  end

  def destroy
    @room_registration = RoomRegistration.find(params[:id])
    @room_registration.destroy
    flash[:notice] = "ルームを削除しました"
    redirect_to room_registrations_path
  end
end
