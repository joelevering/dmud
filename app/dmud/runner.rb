class Runner

  FIRST_ROOM_ID = 6

  def self.start
    new(nil).start
    # Find and display current room
    # Await input
    # Respond appropriately
    # Loop back to awaiting input
  end

  def initialize(room)
    @current_room = room || ::Room.find(FIRST_ROOM_ID)
  end

  def start
    display_room

    while true
      puts "What would you like to do?"
      input = gets.chomp

      if user_wants_to_quit?(input)
        stop
        return false
      end

      respond_to_input(input)
    end
  end

  private

  def display_room
    puts DisplayRoom.new(@current_room).display
  end

  def respond_to_input(input)
  end

  def user_wants_to_quit?(input)
    input == "quit" ? true : false
  end

  def stop
    puts "K thx bai"
  end
end
