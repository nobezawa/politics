class AddColumnPartyAnswerTo < ActiveRecord::Migration
  def change
  	add_column :party_answers, :answer_content, :integer
  end
end
