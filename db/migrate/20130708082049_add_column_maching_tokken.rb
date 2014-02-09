class AddColumnMachingTokken < ActiveRecord::Migration
  def up
    add_column :machings, :access_token, :string
  end

  def down
    remove_column :machings, :access_token
  end
end
