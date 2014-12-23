require 'spec_helper'

describe Room do

  it "accepts attributes for entrances and exits" do
    let(:room) { Room.new(entrances_attributes: entrances_attributes, exits_attributes: exits_attributes) }
    let(:entrances_attributes) { { origin_room_id: other_room.id, destination_room_id: room.id} }
    let(:exits_attributes) { {} }
  end

end
