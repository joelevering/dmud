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
    elsif command_begins_with?("inventory")
      display_player_inventory
    elsif command_begins_with?("take")
      attempt_to_take_item
    elsif command_begins_with?("drop")
      attempt_to_drop_item # add this method
    end
  end

  private

  def user_wants_to_quit?
    @command == "quit" ? true : false
  end

  def input_associated_with_exit?
    current_room_exit_triggers.include?(@command)
  end

  def command_begins_with?(string)
    if @command.split.first.downcase == string.downcase
      return true
    else
      return false
    end
  end

  def display_player_inventory
    puts "You currently hold the following items:"
    player.items.each { |item| puts item.name }
  end

  def attempt_to_take_item
    if room_has_item?
      give_player_item
      puts "You take the #{name_of_item}"
    else
      puts "That item isn't here!"
    end
  end

  def room_has_item?
    room.items.pluck(:name).include?(name_of_item)
  end

  def name_of_item
    @command.split[1..-1].join(" ")
  end

  def give_player_item
    player.items << room.items.where("lower(name) = ?", name_of_item.downcase).first
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

  def player
    @runner.player
  end
end
