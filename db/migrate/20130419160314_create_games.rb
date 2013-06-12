class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :turn, :default => false
      t.boolean :auto_opponent, :default => true

      t.timestamps
    end
  end
end
