class CreatePartyAnswers < ActiveRecord::Migration
  def change
    create_table :party_answers, :id=>false do |t|
      t.integer :party_id
      t.integer :question_id

      t.timestamps
    end
  end
end
