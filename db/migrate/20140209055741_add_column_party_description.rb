class AddColumnPartyDescription < ActiveRecord::Migration
  def change
    add_column :parties, :description, :text
  end
end
