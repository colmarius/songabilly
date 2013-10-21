class Api::GenresController < Api::BaseController

  def index
    render json: Genre.all_names
  end
end
