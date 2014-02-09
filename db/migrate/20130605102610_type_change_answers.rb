class TypeChangeAnswers < ActiveRecord::Migration
  def up
    change_column(:answers, :answer_content, :integer);
  end

  def down
    change_column(:answers, :answer_content, :text);
  end
end
