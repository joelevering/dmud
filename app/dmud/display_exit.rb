class DisplayExit

  def initialize(room_exit)
    @exit = room_exit
  end

  def display
    @exit.description
  end
end

