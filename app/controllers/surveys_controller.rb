class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  # GET /surveys/1
  def show
  end

  # GET /surveys/new
  def new
    @survey = Survey.new(author_id: session[:user_id])
    question = @survey.questions.build
    question.options.build
  end

  # GET /surveys/1/edit
  def edit
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
