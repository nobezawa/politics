class Answer < ActiveRecord::Base
  
  # 賛成
  FAVOR = 10
  # 反対
  OPPOSITE = 10
  # 中立
  NEUTRAL = 10
  # やや賛成
  Y_FAVOR = 5
  #やや反対
  Y_OPPOSITE = 5

  #得点計算
  



  has_many :questions
  belongs_to :maching
  accepts_nested_attributes_for :maching





  attr_accessible( 
    :question_id,
    :maching_attributes,
    :answer_content,
    :maching_id
  )

  validates :question_id, {
    :presence => true
  }


  validates :answer_content, {
    :presence => true
  }

end
