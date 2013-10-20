module GameApi
  extend ActiveSupport::Concern

  included do
    def to_api
      {
        id: id,
        tracks: quizzes.map(&:to_api)
      }
    end
  end
end
