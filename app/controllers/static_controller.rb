class StaticController < ApplicationController
  def index

  end

  def game
    @genre = params[:genre]
    # Place Echo nest api call here
  end

  def end

  end
end
