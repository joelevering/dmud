class CommandRouter

  def self.route_command(command:, runner:)
    new(command: command, runner: runner).route_command
  end

  def initialize(command:, runner:)
    @command = command
    @runner = runner
  end

  def route_command
    if user_wants_to_quit?
      throw :stop
    elsif input_associated_with_exit?
      update_current_room_from_input
    end
  end

  private

  def user_wants_to_quit?
    @command == "quit" ? true : false
  end

  def input_associated_with_exit?
    current_room_exit_triggers.include?(@command)
  end

  def current_room_exit_triggers
    room.exits.pluck(:trigger)
  end

  def update_current_room_from_input
    room_exit = room.exits.find_by_trigger(@command)

    @runner.update_current_room(Room.find(room_exit.destination_room_id))
  end

  def room
    @runner.current_room
  end
end
