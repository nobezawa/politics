class DropColumnAnswerParty < ActiveRecord::Migration
  def change
    remove_column :party_answers, :created_at
    remove_column :party_answers, :updated_at
  end

end
