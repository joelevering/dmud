class CreateCharacterStats < ActiveRecord::Migration
  def change
    create_table :character_stats do |t|
      t.integer :character_id

      t.integer :level

      t.integer :health
      t.integer :mana

      t.integer :attack
      t.integer :defense
      t.integer :dexterity
      t.integer :magic

      t.timestamps
    end

    add_index :character_stats, :character_id
  end
end
