class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :game_id
      t.integer :tile_id
      t.boolean :value

      t.timestamps
    end
  end
end
