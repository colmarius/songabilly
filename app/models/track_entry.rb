class TrackEntry < ActiveRecord::Base

  include Trackable

  belongs_to :game_entry
  serialize :payload, Hash
  
  # validates :game_entry, presence: true

  def to_json
    {
      id: id,
      correct_answer: payload[:correct_answer],
      preview_url: payload[:preview_url],
      answers: payload[:answers]
    }
  end

  def self.generate(genre, count)
    tracks = retrieve(genre, count * 3)
    tracks.each_slice(3).map { |batch| TrackEntry.create_new(batch) }
  end

  def self.create_new(tracks)
    t = TrackEntry.new
    chosen_answer_id = choose_id_from(tracks)

    t.payload[:answers] = []
    tracks.each_with_index do |track, index|
      current_track = tracks[index]

      if index == chosen_answer_id
        t.payload[:track_id] = current_track[:id]
        t.payload[:correct_answer] = answer_for(current_track, index)
        t.payload[:preview_url] = current_track[:tracks].first['preview_url']
      end

      t.payload[:answers] << answer_for(current_track, index)
    end

    t.save ? t : nil
  end

  def self.choose_id_from(tracks)
    Array.new(tracks.count) { |i| i }.sample
  end

  def self.answer_for(track, index)
    {
      answer_id: index,
      artist: track[:artist_name],
      title: track[:title]
    }
  end
end
