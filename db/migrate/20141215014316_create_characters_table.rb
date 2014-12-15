class CreateCharactersTable < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description

      t.integer :race_id
      t.integer :class_id
      t.integer :stats_id

      t.timestamps
    end

    add_index :characters, :race_id
    add_index :characters, :class_id
    add_index :characters, :stats_id
  end
end
