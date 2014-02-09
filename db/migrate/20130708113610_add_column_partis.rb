class AddColumnPartis < ActiveRecord::Migration
  def change
  	add_column :parties, :party_img, :string
  end

end
