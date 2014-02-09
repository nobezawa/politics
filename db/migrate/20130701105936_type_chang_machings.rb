class TypeChangMachings < ActiveRecord::Migration
  def up
    change_column(:machings, :age, :integer)
  end

  def down
    change_column(:machings, :age, :text)
  end
end
