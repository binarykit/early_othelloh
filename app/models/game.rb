class Game < ActiveRecord::Base
  attr_accessible :turn, :auto_opponent
  
  DIRECTIONS = [[-1,0],[1,0],[0,1],[0,-1],[-1,-1],[-1,1],[1,-1],[1,1]]
  
  has_many :tiles, :dependent => :destroy
  has_many :plays, :dependent => :destroy
  
  after_create :initialize_game
  def initialize_game
    # Sets up the board.
    # I admit this isn't the most efficient way to go about this.  I could, for example, create a tile whenever there's a move.
    # I did it this way because it seemed easier to figure out possible moves.
    
    (0...8).each do |row|
      (0...8).each do |col|
        if ((row == 3 && col == 3) || (row == 4 && col == 4))
          tiles << Tile.create(:game_id => self.id, :row => row, :col => col, :value => false)
        elsif ((row == 3 && col == 4) || (row == 4 && col == 3))
          tiles << Tile.create(:game_id => self.id, :row => row, :col => col, :value => true)
        else
          tiles << Tile.create(:game_id => self.id, :row => row, :col => col)
        end
      end
    end
  end
  
  def black_count
    all_positions_for(false).count
  end
  
  def white_count
    all_positions_for(true).count
  end
  
  def change_turn
    update_attribute(:turn, !turn)
  end
  
  def opp(value)
    turn? ? false : true
  end
  
  def all_positions_for(value)
    tiles.select{|tile| (value == true ? tile.is_white? : tile.is_black?) }
  end
  
  def tile_at(pos, dir)
    # both position and direction need to be 1-dim arrays with 2 elements, (x, y) coords
    x, y = pos.first + dir.first, pos.last + dir.last
    (0 <= x && x < 8 && 0 <= y && y < 8) ? tiles[x*8+y] : nil
  end
  
  def moves
    moves_for(turn)
  end
  
  def moves_for(value)
    # Determines possible moves for a player.
    # For each direction, it checks for at least one possible opposite value (a flip) and a tail value (same as the player).
    
    moves = []
    all_positions_for(value).each do |pos|
      DIRECTIONS.each do |dir|
        flips = []
        tested_tile = tile_at([pos.row, pos.col], dir)
         
        while !tested_tile.nil? && tested_tile.value == opp(value)
          flips << tested_tile
          tested_tile = tile_at([tested_tile.row, tested_tile.col], dir)
        end
        
        if flips.any? && !tested_tile.nil? && tested_tile.value.nil?
          ind = moves.index{ |el| el[:move] == tested_tile }
          if ind.nil?
            moves << { :move => tested_tile, :flips => flips, :corner => tested_tile.is_corner? }
          else
            moves[ind][:flips] = (moves[ind][:flips] + flips).uniq
          end
        end 
      end
    end
    
    return moves
  end
  
  def undo_last_play
    # If you undo, all flips and the tail value need to be switched back.
    change_turn #back
    play_to_undo = plays.last
    play_to_undo.tiles.each { |mid_tile| mid_tile.flip(nil) }
    play_to_undo.tile.set_value(nil)
    play_to_undo.delete
  end
  
  def undos_allowed?
    !auto_opponent? && plays.any?
  end
  
  def auto_opponent_needs_to_play?(moves)
    auto_opponent? && turn? && moves.any?
  end
  
  def auto_play(moves)
    # This issues an opponent's play if you were playing the computer.
    # If there's a tail in a corner, it goes for that move.  Otherwise, the move is whichever has the maximum number of flips.
    # This isn't super efficient either; I just wanted to get something running quickly.
    
    prev_tiles = tiles.map { |tile| {:row => tile.row, :col => tile.col, :value => tile.value} }
    
    move_index_with_max_flips = 0
    move_index_of_last_corner = nil
    max_flips = 0
    
    moves.each_index do |move_index|
      ct = moves[move_index][:flips].count
      if ct >= max_flips
        max_flips = ct
        move_index_with_max_flips = move_index
      end
      
      move_index_of_last_corner = move_index if moves[move_index][:corner]
    end
  
    move = move_index_of_last_corner.nil? ? moves[move_index_with_max_flips][:move] : moves[move_index_of_last_corner][:move]
    
    play = Play.create(:game_id => self.id, :tile_id => move.id, :value => turn)
    moves[move_index_with_max_flips][:flips].each { |mid_tile| mid_tile.flip play }
    move.set_value(turn)
    change_turn
    
    return prev_tiles
  end
end
