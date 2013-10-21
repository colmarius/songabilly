class Genre < ActiveRecord::Base
  has_many :tracks

  def self.all_names
    @all_names ||= all.map(&:name).sort.uniq
  end
end
