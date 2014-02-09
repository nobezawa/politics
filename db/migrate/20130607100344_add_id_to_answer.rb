class AddIdToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :maching_id, :integer
  end
end
