module Trackable
  extend ActiveSupport::Concern

  included do

    GenreTypes = [ 'genre-radio' ]
    Buckets = [ 'id:7digital-US', 'tracks' ]

    def self.retrieve(genre, count)
      $echo.playlist.static({
        type: GenreTypes.sample,
        bucket: Buckets,
        genre: genre,
        results: count,
        limit: 'true'
      })
    end
  end
end