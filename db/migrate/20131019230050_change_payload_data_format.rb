class ChangePayloadDataFormat < ActiveRecord::Migration
  def self.up
   change_column :track_entries, :payload, :text
  end

  def self.down
   change_column :track_entries, :payload, :string
  end
end
