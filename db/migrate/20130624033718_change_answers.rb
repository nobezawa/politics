class ChangeAnswers < ActiveRecord::Migration
  def up
  	change_column :answers, :answer_content, :integer
  end

  def down
  	change_column :answers, :answer_content, :string
  end
end
