class Api::GameController < ApplicationController
  respond_to :json

  def index
    genre = params[:genre]
    render json: GameEntry.create_new(genre).to_json
  end

  def check
    game_id = params[:id]
    track_id = params[:track_id]
    render json: { status: ['good', 'bad'].sample }
  end
end
