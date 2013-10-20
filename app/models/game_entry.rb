class GameEntry < ActiveRecord::Base
  has_many :track_entries

  # validates :track_entries, presence: true

  def to_json
    {
      id: id,
      tracks: track_entries.map(&:to_json)
    }
  end

  def has_correct?(track_answers)
    received = track_answers.map { |t, v|
      [v[:track_id], v[:answer_id]]
    }.sort

    correct = track_entries.map { |t|
      [t.id, t.correct_answer[:answer_id]]
    }.sort

    received == correct
  end

  def self.create_new(genre)
    game = GameEntry.new
    game.track_entries = TrackEntry.generate(genre, 10)
    game.save
    game
  end
end
