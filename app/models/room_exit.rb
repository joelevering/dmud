class RoomExit < ActiveRecord::Base

  has_one :origin_room, class_name: "Room"
  has_one :destination_room, class_name: "Room"

end
