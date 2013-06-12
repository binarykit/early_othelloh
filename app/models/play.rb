class Play < ActiveRecord::Base
  attr_accessible :game_id, :value, :tile_id
  belongs_to :game
  belongs_to :tile
  has_many :tiles
  
  
  def flip_flips
    flip_list.each { |tile_id| Tile.find(tile_id).flip }
  end
end
