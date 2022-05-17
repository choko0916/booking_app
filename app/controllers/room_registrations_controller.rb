class RoomRegistrationsController < ApplicationController
  def index
    @room_registrations = RoomRegistration.all
  end

  def new
    @room_registration = RoomRegistration.new
  end

  def create
    @room_registration = RoomRegistration.new(params.require(:room_registration).permit(:id, :room_name, :room_introduction, :room_price, :room_address, :room_image))
    if @room_registration.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to room_registrations_path
    else
      render :new
    end
  end

  def show
    @user = current_user
    @room_registration = RoomRegistration.find(params[:id])
    @room_booking = RoomBooking.new
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

  def search
    if params[:room_address].present?
      @room_registrations = RoomRegistration.where('room_address LIKE ?', "%#{params[:room_address]}%")
    else
      @room_registrations = RoomRegistration.none
      flash[:notice] = "該当がありませんでした"
    end
  end

  def search_free_word
    if params[:free_word].present?
      @room_registrations = RoomRegistration.where('room_name LIKE ? OR room_address LIKE ? OR room_introduction LIKE ? OR room_price LIKE ?', "%#{params[:free_word]}%", "%#{params[:free_word]}%", "%#{params[:free_word]}%", "%#{params[:free_word]}%")
    else
      @room_registrations = RoomRegistration.none
      flash[:notice] = "該当がありませんでした"
    end
  end

end
