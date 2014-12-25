class Runner

  FIRST_ROOM_ID = 6

  attr_reader :current_room, :player

  def self.start
    new(nil).start
  end

  def initialize(room)
    @current_room = room || ::Room.find(FIRST_ROOM_ID)
    @player = Character.first || Character.create(name: "Slime King", description: "King o' da slimes")
    @command_router = CommandRouter
  end

  def start
    catch :stop do
      while true
        @current_room.reload
        @player.reload
        display_room
        display_prompt

        get_and_respond_to_input
      end
    end
  end

  def update_current_room(new_room)
    @current_room = new_room
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

    @command_router.route_command(command: input, runner: self)
  end

end
