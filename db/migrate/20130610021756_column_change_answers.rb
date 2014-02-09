class ColumnChangeAnswers < ActiveRecord::Migration
  def up
    change_column :answers, :answer_content, :string
  end

  def down
    change_column :answers, :answer_content, :integer
  end
end
