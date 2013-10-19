class GameGenerator
  TRACKS_NUMER = 10
  CHOICES_NUMBER = 3
  def initialize(user, genre)
    @game = Game.create(genre: genre)
    if need_to_fetch_tracks?(user, genre)
      Echonest::TrackFetcher.fetch(genre.name)
    end
    tracks = Track.limit(TRACKS_NUMER * CHOICES_NUMBER).order("RAND()")
    tracks.shuffle.each_slice(CHOICES_NUMBER) do |choices|
      @game.quizzes.create(options: choices, right_answer: choices.sample)
    end
    @game
  end

  def need_to_fetch_tracks?(user, genre)
    # (Track.where(genre: genre).count - user.viewed_track(genre)) < (TRACKS_NUMER * CHOICES_NUMBER)
    true
  end
end
