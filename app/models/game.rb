class Game < ActiveRecord::Base
  include GameApi

  has_many :quizzes
  belongs_to :genre
end
