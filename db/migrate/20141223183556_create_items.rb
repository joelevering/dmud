class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :owner_id
      t.string :owner_type

      t.string :name
      t.text :description

      t.timestamps
    end

    add_index :items, [:owner_id, :owner_type]
  end
end
