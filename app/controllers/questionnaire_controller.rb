class QuestionnaireController < ApplicationController
  def new
    @survey = Survey.where(token: params[:token]).first
    unless @survey
      redirect_to questionnaire_notfound_path
    end
    @taker = Taker.create
    @taker.token_create
  end

  def create
    @survey = Survey.find(survey_params[:id])
    # byebug
    if @survey.update(survey_params)
      redirect_to questionnaire_show_path, notice: 'Survey was successfully taken.'
    else
      @taker = Taker.find(survey_params[:questions_attributes]["0"][:answers_attributes]["0"][:taker_id])
      render :new
    end
  end

  def show
  end

  def notfound
  end

  private def survey_params
    params.require(:survey).permit(:id, questions_attributes: [:id, answers_attributes: [:id, :answer, :taker_id, :_destroy]])
  end

end
