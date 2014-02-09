# -*- coding: utf-8 -*-
module MachingHelper

	def user_data_label(text)
    case text
      when 'Gender'
        p "性別"
      when 'Age'
        p "年齢層"
      when 'Electoral zone'
        p "選挙区"
      when 'Party'
      	p "支持政党"
      when 'Voting'
      	p "投票頻度"
    end

  end
end
