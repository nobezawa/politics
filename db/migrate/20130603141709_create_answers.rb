class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.text :answer_content, null: false
      t.timestamps
    end
  end
end
