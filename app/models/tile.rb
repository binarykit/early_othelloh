class Tile < ActiveRecord::Base
  attr_accessible :col, :game_id, :row, :value, :play_id
  belongs_to :game
  belongs_to :play
  has_many :plays
  
  def is_white?
    value?
  end
  
  def is_black?
    value == false
  end
  
  def flip(play)
    flip_to = is_white? ? false : true
    update_attributes(:value => flip_to, :play_id => (play.nil? ? nil : play.id))
  end
  
  def is_available?(moves)
    # returns the number of flips
    m = moves.select{ |el| el[:move] == self }
    m.any? ? m.first[:flips].count : 0
  end
  
  def set_value(new_value)
    update_attribute(:value, new_value)
  end
  
  def is_corner?
    [0,8].include?(row) && [0,8].include?(col)
  end
end
