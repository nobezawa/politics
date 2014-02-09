class ChangeTypequestion < ActiveRecord::Migration
  def up
    change_column(:questions, :party1, :integer);
    change_column(:questions, :party2, :integer);
    change_column(:questions, :party3, :integer);
    change_column(:questions, :party4, :integer);
    change_column(:questions, :party5, :integer);
    change_column(:questions, :party6, :integer);
    change_column(:questions, :party7, :integer);
    change_column(:questions, :party8, :integer);
    change_column(:questions, :party9, :integer);
    change_column(:questions, :party10, :integer);
  end

  def down
    change_column(:questions, :party1, :text);
    change_column(:questions, :party2, :text);
    change_column(:questions, :party3, :text);
    change_column(:questions, :party4, :text);
    change_column(:questions, :party5, :text);
    change_column(:questions, :party6, :text);
    change_column(:questions, :party7, :text);
    change_column(:questions, :party8, :text);
    change_column(:questions, :party9, :text);
    change_column(:questions, :party10, :text);
  end
end
