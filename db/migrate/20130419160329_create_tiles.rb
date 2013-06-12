class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.integer :row
      t.integer :col
      t.boolean :value
      t.integer :game_id
      t.integer :play_id

      t.timestamps
    end
  end
end
