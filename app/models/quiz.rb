require 'track'
class Quiz < ActiveRecord::Base
  belongs_to :game
  serialize :options, Array
  serialize :right_answer

  def correct?(answer_id)
    right_answer.echonest_track_id == answer_id
  end
end
