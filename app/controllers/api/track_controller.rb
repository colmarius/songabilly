class Api::TrackController < ApplicationController
  respond_to :json

  def answer
    track = TrackEntry.find(params[:id])

    if !track.is_correct? params['check_id']
      render json: { result: 'wrong' }
    else
      render json: {
        result: 'correct',
        correct: {
          artist: track.correct_answer[:artist],
          title: track.correct_answer[:title]
        }
      }
    end
  end
end
