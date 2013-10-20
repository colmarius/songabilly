require 'track'
class Quiz < ActiveRecord::Base
  include TrackApi

  belongs_to :game
  serialize :options, Array
  serialize :right_answer

  def correct?(answer_id)
    right_answer.id == answer_id
  end
end
