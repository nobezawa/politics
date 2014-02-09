# -*- coding: utf-8 -*-

class Question < ActiveRecord::Base

  belongs_to :answer, foreign_key: "question_id"
  has_many :party_answers
  has_many :questions, through: :party_answers, :uniq => true
  
  accepts_nested_attributes_for :party_answers

  attr_accessible(
    :question_content,
    :question_id,
    :question_description,
    :question_img,
    :answer_content,
    :party_answers_attributes
  )

  question_label = { question_con: "質問内容", opinion: "考え" }

end
