class RoomRegistration < ApplicationRecord
  mount_uploader :room_image, RoomImageUploader
  has_many :room_bookings
end
