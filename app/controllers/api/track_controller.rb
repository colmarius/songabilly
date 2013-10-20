class Api::TrackController < Api::BaseController

  def answer
    # track = TrackEntry.find(params[:id])
    # result = track.is_correct?(params['check_id']) ? 'correct' : 'wrong'

    quiz = Quiz.find(params[:id])
    result = quiz.correct?(params['check_id']) ? 'correct' : 'wrong'

    render json: {
        result: result,
        correct: quiz.correct_answer_to_api
      }
  end
end
