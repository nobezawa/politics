class DeleteNullMachings < ActiveRecord::Migration
  def up
  	change_column(:machings, :policy1, :string, :null => true)
  	change_column(:machings, :policy2, :string, :null => true)
  	change_column(:machings, :policy3, :string, :null => true)
  end

  def down
  	change_column(:machings, :policy1, :string)
  	change_column(:machings, :policy2, :string)
  	change_column(:machings, :policy3, :string)
  end
end
