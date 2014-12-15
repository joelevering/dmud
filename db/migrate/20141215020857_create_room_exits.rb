class CreateRoomExits < ActiveRecord::Migration
  def change
    create_table :room_exits do |t|
      t.integer :origin_room_id
      t.integer :destination_room_id

      t.string :description
      t.string :trigger

      t.timestamps
    end

    add_index :room_exits, :origin_room_id
    add_index :room_exits, :destination_room_id
  end
end
