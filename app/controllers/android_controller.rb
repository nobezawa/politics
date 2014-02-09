# -*- coding: utf-8 -*-
require 'open-uri'

class AndroidController < ApplicationController

  include MachingSum

  def index
    redirect_to action: "new"
  end

  def new
    @maching = Maching.new
    @answers = Answer.new
  end

  def create
    @parties = Party.find(:all)
    tmp = params[:question]
    user_data = { gender: params[:gender], age: params[:age], zone: params[:zone], uuid: params[:uuid] }
    save_data = question_hash(tmp, user_data)
    @maching = Maching.new(save_data)
    @maching.save

    @machings = Maching.where(:access_token => @maching[:access_token]).first
    @user = Maching.find_by_access_token!(@maching[:access_token])
    @json = sum_maching(@user[:id])

    name = @parties[(@json[0][0] - 1)].party_name
    photo = @parties[(@json[0][0] - 1)].party_img
    img = 'http://' + request.host + photo
    link = 'http://kokkai-tsuushinbo.jp/machings/' +  @maching[:access_token]
    @user_answer = {party: name, photo: img, permalink: link }
    @hash_ans = {result: @user_answer}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hash_ans }
    end
  end

  private
  def question_hash(ans_content,person_data)
    ans_hash = Hash::new
    i = 0
    ans_content.each_with_index do |value, key|
      ans_hash[i] = {"answer_content" => value[1], "question_id" => value[0] }
      i += 1
    end
    ans_hash = ans_hash.stringify_keys

    hash = {"answers_attributes" => ans_hash,
            "gender"=> person_data[:gender],
            "age" => person_data[:age],
            "electoral_zone" => person_data[:zone],
            "cookie_id" => person_data[:uuid],
    }
    
  end

  private
  def hash_convert(hash)
    ans = Hash::new
    value = hash.values.map { |i| i.to_i  }
    i = 0
    value.each do |a|
      i += 1
      ans[i] = {question_id: i, answer_content: a}
    end
    ans
  end


end
