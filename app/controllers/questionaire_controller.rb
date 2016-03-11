class QuestionaireController < ApplicationController
  def new
    @survey = Survey.where('token = ? ', params[:token])
    if @survey.empty?
      redirect_to questionaire_notfound_path
    end
  end

  def create
  end

  def show
  end

  def notfound
  end
end
