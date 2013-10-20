module Trackable
  extend ActiveSupport::Concern

  included do

    GenreTypes = [ 'genre-radio' ]
    Buckets = [ 'id:7digital-US', 'tracks' ]
    Varieties = [0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
    Adventurousness = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7]
    Distributions = %w(focused wandering)

    def self.retrieve(genre, count)
      $echo.playlist.static({
        type: GenreTypes.sample,
        bucket: Buckets,
        genre: genre,
        results: count,
        variety: Varieties.sample,
        adventurousness: Adventurousness.sample,
        distribution: Distributions.sample,
        limit: 'true'
      })
    end
  end
end