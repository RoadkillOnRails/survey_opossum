class QuestionaireController < ApplicationController
  def new
    @survey = Survey.where(token: params[:token]).first
    unless @survey
      redirect_to questionaire_notfound_path
    end
    @questions = @survey.questions
    @answer = Answer.new
  end

  def create
  end

  def show
  end

  def notfound
  end

  
end
