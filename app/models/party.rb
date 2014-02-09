class Party < ActiveRecord::Base

  has_many :party_answers
  has_many :questions, through: :party_answers
  accepts_nested_attributes_for :questions

  attr_accessible(
    :party_id,
    :party_name,
    :party_img
  )


end
