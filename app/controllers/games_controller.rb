class GamesController < ApplicationController
  # GET games/:id/undo
  def undo
    @game = Game.find(params[:id])
    @game.undo_last_play
    
    respond_to do |format|
      format.html { redirect_to show_game_path(@game) }
      format.json { render :json => @game }
    end
  end
  
  # GET /games/:id/:player/:move_id
  # GET /games/:id/:player/:move_id.json
  def play
    @game = Game.find(params[:id])
    @moves = @game.moves
    
    tile = Tile.find(params[:move_id])
    move = @moves.select{ |el| el[:move] == tile }
    if move.any?
      play = Play.create(:game_id => @game.id, :tile_id => tile.id, :value => @game.turn)
      move.first[:flips].each { |mid_tile| mid_tile.flip play }
      tile.set_value(@game.turn)
      @game.change_turn
    end
    
    respond_to do |format|
      format.html { redirect_to show_game_path(@game) }
      format.json { render :json => @game }
    end
  end
  
  # GET /games/1
  # GET /games/1.json
  def show
    respond_to do |format|
      games = Game.where(:id => params[:id])
      @outcome = nil
      
      if games.any?
        @game = games.first
    
        @moves = @game.moves
        @game_before_auto_play_tiles = []
    
        if @game.auto_opponent_needs_to_play?(@moves)
          @game_before_auto_play_tiles = @game.auto_play(@moves)
          @moves = @game.moves
        end
    
        unless @moves.any?
          b = @game.black_count
          w = @game.white_count
          @outcome = b > w ? 'black' : (b == w ? 'draw' : 'white')
        end
    
        format.html # show.html.erb
        format.json { render :json => @game }
      else
        format.html { redirect_to new_game_path }
      end
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    if defined?(params[:id])  && !params[:id].nil?
      game = Game.find(params[:id])
      game.destroy
    end
    @game = Game.create(:auto_opponent => false)
    
    respond_to do |format|
      format.html { redirect_to show_game_path(@game) }
      format.json { render :json => @game, :status => :created, :location => @game }
    end
  end
  
  # GET /games/new/auto
  # GET /games/new.json
  def auto
    if defined?(params[:id])  && !params[:id].nil?
      game = Game.find(params[:id])
      game.destroy
    end
    @game = Game.create
    
    respond_to do |format|
      format.html { redirect_to show_game_path(@game) }
      format.json { render :json => @game, :status => :created, :location => @game }
    end
  end
end
