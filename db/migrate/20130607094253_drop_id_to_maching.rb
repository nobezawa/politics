class DropIdToMaching < ActiveRecord::Migration
  def up
    remove_column :machings, :maching_id
  end

  def down
   add_column :machings, :maching_id
  end
end
