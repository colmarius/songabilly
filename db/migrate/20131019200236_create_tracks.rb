class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.references :artist, index: true
      t.references :genre, index: true
      t.string :echonest_track_id
      t.string :title
      t.string :audio_clip_url

      t.timestamps
    end
  end
end
