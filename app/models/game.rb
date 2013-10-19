class Game < ActiveRecord::Base
  has_many :quizzes
  belongs_to :genre
end
