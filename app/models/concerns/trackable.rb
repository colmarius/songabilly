module Trackable
  extend ActiveSupport::Concern

  included do

    GenreTypes = [ 'genre-radio' ]
    Buckets = [ 'id:7digital-US', 'tracks' ]
    Genres = ['jazz', 'blues']

    attr_reader :id, :answers, :correct_answer, :preview_url

    def initialize
      payload = Track.retrieve(3)
      chosen_track = payload.sample

      @id = chosen_track[:id]
      @correct_answer = get_name(chosen_track)
      @preview_url = chosen_track[:tracks].first['preview_url']
      @answers = payload.map { |track| get_name(track) }
    end

    def get_name(track)
      {
        artist: track[:artist_name],
        title: track[:title]
      }
    end

    def to_json
      {
        id: @id,
        correct_answer: @correct_answer,
        preview_url: @preview_url,
        answers: @answers
      }
    end

    def self.retrieve(count)
      $echo.playlist.static({
        type: GenreTypes.sample,
        bucket: Buckets,
        genre: Genres,
        results: count,
        limit: 'true'
      })
    end

    def self.generate(count)
      count.times.map { Track.new }
    end
  end
end