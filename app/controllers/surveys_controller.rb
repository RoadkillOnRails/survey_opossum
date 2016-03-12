class SurveysController < ApplicationController
  before_action :set_survey, only: [:edit, :update, :destroy, :publish, :unpublish]
  before_action :authenticate

  # GET /surveys/1
  def show
    @survey = Survey.find_by(token: params[:token])
    @survey.questions.options
    @question.questions.answers
  end

  # GET /surveys/new
  def new
    @survey = Survey.new(author_id: session[:user_id])
    @question.options.build
    @question.answers.build
  end

  # GET /surveys/1/edit
  def edit
    @surveys = Survey.new(author_id: session[:user_id])
    @survey.questions.build
    @survey.answers.build
  end

  # POST /surveys
  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      redirect_to root_path, notice: 'Survey was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /surveys/1
  def update
    if @survey.update(survey_params)
      redirect_to root_path, notice: 'Survey was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey.destroy
    redirect_to root_path, notice: 'Survey was successfully destroyed.'
  end

  def publish
    if @survey.token
      redirect_to root_path, notice: 'Survey has already been published.'
    elsif @survey.publish
      redirect_to root_path, notice: 'Survey was successfully published.'
    else
      redirect_to root_path, notice: 'Survey failed to publish.'
    end
  end

  def unpublish
    if @survey.token.nil?
      redirect_to root_path, notice: 'Survey is already unpublished.'
    elsif @survey.answers.count > 0
      redirect_to root_path, notice: 'Survey failed to unpublish as it has already recieved responses.'
    elsif @survey.unpublish
      redirect_to root_path, notice: 'Survey successfully unpublished and ready to edit.'
    else
      redirect_to root_path, notice: 'Survey failed to unpublished.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def survey_params
      params.require(:survey).permit(:author_id, :title, :description, :token, questions_attributes: [:id, :question_type_id, :question_text, :description, :required, :order, :_destroy, options_attributes: [:id, :option, :value, :_destroy]])
    end
end
