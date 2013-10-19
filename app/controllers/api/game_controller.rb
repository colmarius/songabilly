class Api::GameController < ApplicationController
  respond_to :json

  def index
    render json: Game.new.to_json
  end

  def check
    game_id = params[:id]
    track_id = params[:track_id]
  end
end
