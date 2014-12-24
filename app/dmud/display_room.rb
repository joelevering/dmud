class DisplayRoom

  def initialize(room)
    @room = room
  end

  def display
    <<-display
    #{@room.name}

    #{@room.description}

    Items:#{show_items}

    Exits:#{show_exits}
    display
  end

  private

  def show_items
    return if @room.items.empty?

    @room.items.inject("") do |items_to_display, item|
      items_to_display << " #{item.name}"
    end
  end

  def show_exits
    @room.exits.inject("") do |exits_to_display, room_exit|
      exits_to_display << " #{DisplayExit.new(room_exit).display}"
    end
  end
end
