class Api::GenresController < Api::BaseController

  def index
    render json: Genre.all
  end
end
