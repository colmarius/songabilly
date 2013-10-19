class GameEntry < ActiveRecord::Base
  has_many :track_entries

  # validates :track_entries, presence: true
end
