# -*- coding: utf-8 -*-
class MachingsController < ApplicationController

  include MachingSum

  def index
    @questions = Question.all
    @machings = Maching.new 
    @answers = Answer.new
    @machings.answers.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answers }
    end
  end

  def show
    @machings = Maching.where(:access_token => params[:access_token]).first
    @user = Maching.find_by_access_token!(params[:access_token])
    @user_data = sum_maching(@user[:id])
    @parties = Party.find(:all)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @maching }
    end
  end

  def new
    @maching = Maching.new
    @answers = Answer.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @maching }
    end
  end

  def create
    @maching = Maching.new(params[:maching])
    @maching.save
    redirect_to :action => "show", :access_token => @maching[:access_token]
  end 
  

end
