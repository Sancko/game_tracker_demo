class GamesController < ApplicationController
  # skip_before_filter :verify_authenticity_token

  def index
    @games = Game.includes(:employees)
  end

  def create
    @game = Game.new params.require(:game).permit(:name, :store)

    if @game.save
      render :show
    else
      render_errors @game
    end
  end

  def update
    @game = Game.find params[:id]

    if @game.update(params.require(:game).permit(:id, :name, :store, :status, employee_ids: []))
      render :show, status: :ok
    else
      render_errors @game
    end
  end

  def show
  end
end
