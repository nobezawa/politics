class DropMachingColumn < ActiveRecord::Migration
  def change
  	remove_column(:machings, :party)
  	remove_column(:machings, :voting)
  end

end
