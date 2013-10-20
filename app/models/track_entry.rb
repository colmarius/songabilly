class TrackEntry < ActiveRecord::Base

  include Trackable

  belongs_to :game_entry
  serialize :payload, Hash
  
  # validates :game_entry, presence: true


  # Payload Getters
  def track_id       ; payload[:track_id]       ; end
  def correct_answer ; payload[:correct_answer] ; end
  def preview_url    ; payload[:preview_url]    ; end
  def answers        ; payload[:answers]        ; end

  # Payload Setters
  def track_id=(val)       ; payload[:track_id]=val       ; end
  def correct_answer=(val) ; payload[:correct_answer]=val ; end
  def preview_url=(val)    ; payload[:preview_url]=val    ; end
  def answers=(val)        ; payload[:answers]=val        ; end


  def is_correct?(answer_id)
    correct_answer[:answer_id].to_s == answer_id.to_s
  end

  def to_json
    {
      id: id,
      preview_url: preview_url,
      answers: answers
    }
  end

  def self.generate(genre, count)
    tracks = retrieve(genre, count * 3)
    tracks.each_slice(3).map { |batch| TrackEntry.create_new(batch, genre) }
  end

  def self.create_new(tracks, genre)
    t = TrackEntry.new
    chosen_answer_id = choose_id_from(tracks)

    t.answers = []
    t.genre = genre
    tracks.each_with_index do |track, index|
      current_track = tracks[index]

      if index == chosen_answer_id
        t.track_id = current_track[:id]
        t.correct_answer = answer_for(current_track, index)
        t.preview_url = current_track[:tracks].first['preview_url']
      end

      t.answers << answer_for(current_track, index)
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
