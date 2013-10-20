class Api::GameController < Api::BaseController
  protect_from_forgery with: :null_session

  def index
    genre = params[:genre]
    render json: GameEntry.create_new(genre).to_json
  end

  def create
    genre = Genre.where(name: params[:genre]).first
    game = GameGenerator.create_game(nil, genre)
    render json: {
      id: game.id,
      quizzes: game.quizzes.map { |q|
        {
          id: q.id,
          audio_clip_url: q.right_answer.audio_clip_url,
          valid_choices: q.options.map { |o|
            {
              id: o.echonest_track_id,
              title: o.title,
              artist: o.artist.name
            }
          }
        }
      }
    }
  end

  def check
    game_id = params[:id]
    track_id = params[:track_id]
    render json: { status: ['good', 'bad'].sample }
  end

  def answer
    game = Game.find(params[:id])
    quiz = game.quizzes.find(params[:quiz_id])
    answer_id = params[:answer_id]
    if quiz.correct?(answer_id)
      render json: {
        status: 'correct'
      }
    else
      render json: {
        status: 'wrong',
        correct_answer: {
          title: quiz.right_answer.title,
          artist: quiz.right_answer.artist.name,
          thumbnail_url: quiz.right_answer.thumbnail_url
        }
      }
    end
  end
end
