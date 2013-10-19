class CreateTrackEntries < ActiveRecord::Migration
  def change
    create_table :track_entries do |t|
      t.references :game_entry, index: true
      t.string :payload
      t.string :genre

      t.timestamps
    end
  end
end
