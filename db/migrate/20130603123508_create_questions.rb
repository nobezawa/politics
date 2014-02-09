class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      
      t.integer :question_id, null: false
      t.text :party1, null: false
      t.text :party2, null: false
      t.text :party3, null: false
      t.text :party4, null: false
      t.text :party5, null: false
      t.text :party6, null: false
      t.text :party7, null: false
      t.text :party8, null: false
      t.text :party9, null: false
      t.text :party10, null: false
      t.timestamps
    end
  end
end
