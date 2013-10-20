module TrackApi
  extend ActiveSupport::Concern

  included do
    def correct_answer_to_api
      {
        artist: right_answer.artist.name,
        title: right_answer.title
      }
    end

    def to_api
      {
        id: id,
        preview_url: right_answer.audio_clip_url,
        answers: options.map(&:to_api)
      }
    end
  end
end
