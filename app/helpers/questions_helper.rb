# -*- coding: utf-8 -*-
module QuestionsHelper

  def question_answer_label(num)
    case num
      when 0
        p "反対"
      when 1
        p "賛成"
      when 2
        p "中立"
    end

  end

  def party_content_label(num)
    case num
      when 1
         "賛成"
      when 2
         "やや賛成"
      when 3
         "中立"
      when 4
         "やや反対"
      when 5
         "反対"
    end

  end


end
