class DropColumnQuestion < ActiveRecord::Migration
  def up
    remove_column :questions, :party1
    remove_column :questions, :party2
    remove_column :questions, :party3
    remove_column :questions, :party4
    remove_column :questions, :party5
    remove_column :questions, :party6
    remove_column :questions, :party7
    remove_column :questions, :party8
    remove_column :questions, :party9
    remove_column :questions, :party10
    add_column :questions, :question_id, :integer
  end

  def down
    add_column :questions, :party1, :integer
    add_column :questions, :party2, :integer
    add_column :questions, :party3, :integer
    add_column :questions, :party4, :integer
    add_column :questions, :party5, :integer
    add_column :questions, :party6, :integer
    add_column :questions, :party7, :integer
    add_column :questions, :party8, :integer
    add_column :questions, :party9, :integerrm
    add_column :questions, :party10, :integer
    remove_column :questions, :question_id
  end
end
