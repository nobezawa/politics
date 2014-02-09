class PartiesController < ApplicationController

  def index
    @parties = Party.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parties }
    end

  end


  def show
    @party = Party.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @party
      }
    end
  end


  def new
    @party = Party.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @party }
    end
  end

  # GET /questions/1/edit
  def edit
    @party = Party.find(params[:id])
  end


  def create
    @party = Party.new(params[:party])
    
    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Question was successfully created.' }
        format.json { render json: @party, status: :created, location: @party }
      else
        format.html { render action: "new" }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @party = Party.find(params[:id])

    respond_to do |format|
      if @party.update_attributes(params[:party])
        format.html { redirect_to @party, notice: 'Party was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @party = Party.find(params[:id])
    @party_answers = @party.party_answers
    @party_answers.destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end



end
