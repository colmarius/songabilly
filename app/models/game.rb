class Game
  attr_reader :id, :tracks

  def initialize
    @tracks = Track.generate(10)
    @id = @tracks.first.id
  end

  def to_json
    {
      id: id,
      tracks: tracks
    }
  end
end
