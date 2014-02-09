class AddDataToquestions < ActiveRecord::Migration
  def up
    add_column :questions, :question_content, :string
  end

  def down
    remove_column :questions, :question_content
  end
end
