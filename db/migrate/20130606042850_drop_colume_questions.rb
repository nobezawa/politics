class DropColumeQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :question_id
  end


end
