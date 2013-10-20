class Track < ActiveRecord::Base
  include AnswerApi

  belongs_to :artist
  belongs_to :genre
end
