class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :genre, index: true

      t.timestamps
    end
  end
end
