# -*- coding: utf-8 -*-
class Maching < ActiveRecord::Base

  include UUIDHelper
  validates_uniqueness_of :access_token
  validates_presence_of :access_token
  after_initialize :set_access_token

  private
  def set_access_token
    self.access_token = self.access_token.blank? ? generate_access_token : self.access_token
  end  


  def generate_access_token
    tmp_token = SecureRandom.urlsafe_base64(7)
    self.class.where(:access_token => tmp_token).blank? ? tmp_token : generate_access_token
  end

  def to_param  # overridden
    access_token
  end
   


  has_many :answers
  accepts_nested_attributes_for :answers

  attr_accessible(
    :cookie_id,
    :gender,
    :age,
    :electoral_zone,
    :policy1,
    :policy2,
    :policy3,
    :uuid,
    :access_token,
    :answers_attributes
  )

  GENDER ={"男性" => 1, "女性" => 2} 
  AGE = { "20代" => 1, "30代" => 2, "40代" => 3, "50代" => 4, "60代" => 5, "それ以上" =>6}
  
  PREFECTURES = {
  "1"   => "北海道",
  "2"   => "青森県",
  "3"   => "岩手県",
  "4"   => "宮城県",
  "5"   => "秋田県",
  "6"   => "山形県",
  "7"   => "福島県",
  "8"   => "茨城県",
  "9"   => "栃木県",
  "10"  => "群馬県",
  "11"  => "埼玉県",
  "12"  => "千葉県",
  "13"  => "東京都",
  "14"  => "神奈川県",
  "15"  => "新潟県",
  "16"  => "富山県",
  "17"  => "石川県",
  "18"  => "福井県",
  "19"  => "山梨県",
  "20"  => "長野県",
  "21"  => "岐阜県",
  "22"  => "静岡県",
  "23"  => "愛知県",
  "24"  => "三重県",
  "25"  => "滋賀県",
  "26"  => "京都府",
  "27"  => "大阪府",
  "28"  => "兵庫県",
  "29"  => "奈良県",
  "30"  => "和歌山県",
  "31"  => "鳥取県",
  "32"  => "島根県",
  "33"  => "岡山県",
  "34"  => "広島県",
  "35"  => "山口県",
  "36"  => "徳島県",
  "37"  => "香川県",
  "38"  => "愛媛県",
  "39"  => "高知県",
  "40"  => "福岡県",
  "41"  => "佐賀県",
  "42"  => "長崎県",
  "43"  => "熊本県",
  "44"  => "大分県",
  "45"  => "宮崎県",
  "46"  => "鹿児島県",
  "47"  => "沖縄県"
  }

  
  
end
