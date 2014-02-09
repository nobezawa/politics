class AddColumnQues < ActiveRecord::Migration
  def change
  	add_column :questions, :question_description, :text
  end

end
