class GamesController < ApplicationController
  before_action :set_game, only: [:show]

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @winner_throw = @game.winner_throw
    @loser_throw = @game.loser_throw
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  def destroy
    Game.find(set_game).destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:user_throw)
    end
end
