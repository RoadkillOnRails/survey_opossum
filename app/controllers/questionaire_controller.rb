class QuestionaireController < ApplicationController
  def new
    @survey = Survey.where(token: params[:token]).first
    unless @survey
      redirect_to questionaire_notfound_path
    end
    # @questions = @survey.questions
    # answer = @question.answers.build
    questions = @survey.questions.build
    answers = questions.answers.build
  end

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      redirect_to questionaire_show_path, notice: 'Author was successfully created.'
    else
      question = @survey.questions.build
      question.answers.build
      render :new
    end
  end

  def show
  end

  def notfound
  end

  private def survey_params
    params.require(:survey).permit(:id, questions_attributes: [:id, answer_attributes: [:id, :answer, :_destroy]])
  end
end
