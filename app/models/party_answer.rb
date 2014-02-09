class PartyAnswer < ActiveRecord::Base
  
  belongs_to :party
  belongs_to :question

  attr_accessible(
    :party_id,
    :question_id,
    :answer_content
  )

  validates :party_id, :presence => true
  validates :answer_content, :presence => true
  validates :question_id, :presence => true

end
