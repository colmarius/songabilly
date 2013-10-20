module Echonest
  class TrackFetcher
    MAX_ALLOWED_TRACKS = 100
    GENRE_TYPES = [ 'genre-radio' ]
    BUCKETS = [ 'id:7digital-US', 'tracks' ]
    def self.fetch(genre)
      tracks = $echo.playlist.static({
        type: GENRE_TYPES.sample,
        bucket: BUCKETS,
        genre: genre.name,
        results: MAX_ALLOWED_TRACKS,
        limit: 'true'
      })
      tracks.each do |track|
        artist = Artist.find_or_create_by(echonest_artist_id: track[:artist_id], name: track[:artist_name])
        Track.find_or_create_by(echonest_track_id: track[:id]) do |t|
          t.title = track[:title]
          t.audio_clip_url = track[:tracks].first['preview_url']
          t.thumbnail_url = track[:tracks].first['release_image']
          t.artist = artist
          t.genre = genre
        end unless track[:tracks].empty? or track[:tracks].first['preview_url'].empty?
      end
    end
  end
end
