class Room < ActiveRecord::Base

  has_many :exits, class_name: "RoomExit", foreign_key: :origin_room_id
  has_many :entrances, class_name: "RoomExit", foreign_key: :destination_room_id

end
