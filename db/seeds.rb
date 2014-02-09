# -*- coding: utf-8 -*-
require "csv"


CSV.foreach('db/party_answers.csv') do |row|
  PartyAnswer.create(
  	:party_id => row[0],
  	:question_id => row[1],
  	:answer_content=> row[2]
  )
end
