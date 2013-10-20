class Api::TrackController < Api::BaseController

  def answer
    track = TrackEntry.find(params[:id])
    result = track.is_correct?(params['check_id']) ? 'correct' : 'wrong'

    render json: {
        result: result,
        correct: {
          artist: track.correct_answer[:artist],
          title: track.correct_answer[:title]
        }
      }
  end
end
