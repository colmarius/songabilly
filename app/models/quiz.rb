require 'track'
class Quiz < ActiveRecord::Base
  belongs_to :game
  serialize :options, Array
  serialize :right_answer
end
