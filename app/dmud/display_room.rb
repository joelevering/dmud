class DisplayRoom

  def initialize(room)
    @room = room
  end

  def display
    <<-display
    #{@room.name}

    #{@room.description}
    display
  end

end
