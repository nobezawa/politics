class AddIdToMaching < ActiveRecord::Migration
  def change
    add_column :machings, :maching_id, :integer
  end
end
