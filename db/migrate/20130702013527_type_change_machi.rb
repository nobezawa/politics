class TypeChangeMachi < ActiveRecord::Migration
  def up
  	change_column(:machings, :electoral_zone, :integer)
  end

  def down
  	change_column(:machings, :electoral_zone, :text)
  end
end
