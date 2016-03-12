class QuestionaireController < ApplicationController
  def new
    @survey = Survey.where(token: params[:token]).first
    unless @survey
      redirect_to questionaire_notfound_path
    end
  end

  def create
    @survey = Survey.find(survey_params[:id])
    # byebug
    if @survey.update(survey_params)
      redirect_to questionaire_show_path, notice: 'Survey was successfully taken.'
    else
      render :new
    end
  end

  def show
  end

  def notfound
  end

  private def survey_params
    params.require(:survey).permit(:id, questions_attributes: [:id, answers_attributes: [:id, :answer, :_destroy]])
  end

end
