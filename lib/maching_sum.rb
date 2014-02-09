# -*- coding: utf-8 -*-


module MachingSum

  	def sum_maching(num)
    @user = Hash::new
    @party = Party.find(:all)
    @answer_content = Answer.find(:all, :select => "question_id, answer_content", :conditions => {:maching_id => num})
    @answer_content.sort_by{|i, q, a| q }
    @party.each do |p|
      count = 0
      p.party_answers.sort { |a, b| a[:question_id] <=> b[:question_id] }.each_with_index do |value,key|       
        @user[value[:party_id]] = 0
        @answer_content.each_with_index do |value_ans,key_ans|
            case
            when value_ans[:question_id] == value[:question_id] && value_ans[:answer_content] == value[:answer_content]
              count += 1
            when value_ans[:question_id] == value[:question_id] && (value_ans[:answer_content] == 1 && value[:answer_content] == 2)
              count += 0.5
            when value_ans[:question_id] == value[:question_id] && (value_ans[:answer_content] == 2 && value[:answer_content] == 1)
              count += 0.5
            when value_ans[:question_id] == value[:question_id] && (value_ans[:answer_content] == 4 && value[:answer_content] == 5)
              count += 0.5
            when value_ans[:question_id] == value[:question_id] && (value_ans[:answer_content] == 5 && value[:answer_content] == 4)
              count += 0.5
            end
          end  
        @user[value[:party_id]] = count
      end
    end
      @user.delete(nil)
      marks(@user)
    end


  private
  def marks(array)
    question_deal = Question.find(:all, :select=>"id").size
    question_deal = 100 / question_deal.round(1)
    question_deal.round(2)
    x = {}; array.map {|k, v| x[k] = v*question_deal}
    x.sort{|a, b| b[1] <=> a[1]}
  end


end
