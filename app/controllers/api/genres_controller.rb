class Api::GenresController < ApplicationController
  respond_to :json

  def index
    render json: Genre.all.to_json
  end
end
