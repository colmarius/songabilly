class TrackEntry < ActiveRecord::Base
  belongs_to :game_entry
  serialize :payload, Hash

  # validates :game_entry, presence: true
end
