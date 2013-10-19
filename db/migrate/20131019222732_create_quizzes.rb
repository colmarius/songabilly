class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.text :options
      t.references :game, index: true
      t.text :right_answer

      t.timestamps
    end
  end
end
