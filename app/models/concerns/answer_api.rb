module AnswerApi
  extend ActiveSupport::Concern

  included do
    def to_api
      {
        answer_id: id,
        artist: artist.name,
        title: title
      }
    end
  end
end
