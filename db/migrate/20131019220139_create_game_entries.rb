class CreateGameEntries < ActiveRecord::Migration
  def change
    create_table :game_entries do |t|
      t.string :external_id

      t.timestamps
    end
  end
end
