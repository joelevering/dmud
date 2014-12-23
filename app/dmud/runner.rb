class Runner

  FIRST_ROOM_ID = 6

  def self.start
    new(nil).start
  end

  def initialize(room)
    @current_room = room || ::Room.find(FIRST_ROOM_ID)
  end

  def start
    catch :stop do
      while true
        display_room
        display_prompt

        get_and_respond_to_input
      end
    end
  end

  private

  def display_room
    puts DisplayRoom.new(@current_room).display
  end

  def display_prompt
    puts "What would you like to do?"
  end

  def get_and_respond_to_input
    input = gets.chomp

    respond_to_input(input)
  end

  def respond_to_input(input)
    if user_wants_to_quit?(input)
      throw :stop
    elsif input_associated_with_exit?(input)
      update_current_room_from_input(input)
    end
  end

  def user_wants_to_quit?(input)
    input == "quit" ? true : false
  end

  def input_associated_with_exit?(input)
    current_room_exit_triggers.include?(input)
  end

  def current_room_exit_triggers
    @current_room.exits.pluck(:trigger)
  end

  def update_current_room_from_input(input)
    room_exit = @current_room.exits.find_by_trigger(input)
    @current_room = Room.find(room_exit.destination_room_id)
  end
end
