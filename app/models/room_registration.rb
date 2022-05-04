class RoomRegistration < ApplicationRecord
  has_many :room_bookings
  mount_uploader :room_image, RoomImageUploader
end
