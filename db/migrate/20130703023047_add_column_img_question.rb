class AddColumnImgQuestion < ActiveRecord::Migration
  def change
  	add_column :questions, :question_img, :string
  end
end
