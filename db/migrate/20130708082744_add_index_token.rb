class AddIndexToken < ActiveRecord::Migration
  def change
    add_index :machings, :access_token, unique: true
  end

 
end
