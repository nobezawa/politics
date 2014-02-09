# -*- coding: utf-8 -*-
require 'open-uri'

class QuestionsController < ApplicationController

  def index
    url = request.host
    uuid = UUID.new.generate
    @questions = Question.find(:all, :order=>"question_id ASC")
    @question_content = Question.find(:all, :select=>"id, question_content, question_description, question_img", :order=>"question_id ASC")
    @question_content.each do |value|
      value[:question_img] = 'http://' + url + value[:question_img]
    end
    @hash = {questions: @question_content, uuid: uuid}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hash }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @question = Question.find(params[:id])
    @parties = Party.all
    @party_answers = PartyAnswer.find(:all, :select => "answer_content", :conditions => {:question_id => params[:id]})
    @edit_id = params[:id].to_i
  end


  def new
    @question = Question.new
    @party_answers = PartyAnswer.new
    @question.party_answers.build
    @parties = Party.all
  end

  # GET /questions/1/edit


  def create
    @question = Question.new(params[:question])
    @party = PartyAnswer.new(params[:party_answers])
  
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @questions.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @question = Question.find(params[:id])
    @question.party_answers.build
    @parties = Party.all
  end


  def update
    @question = Question.find(params[:id])
    @party_answer = @question.party_answers.find_all_by_question_id(params[:id])
    PartyAnswer.where(question_id: params[:id]).delete_all
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

end
