class AddThumbnailUrlToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :thumbnail_url, :string
  end
end
