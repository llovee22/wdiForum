class AnswersController < ApplicationController
  def create
    @survey = Survey.find(params[:survey_id])
    if logged_in?
      @answer = @survey.answers.create(answer_params)
      @answer.user_id = current_user.id
      if @answer.save
        redirect_to survey_path(@survey)
      else
        redirect_to survey_path(@survey)
      end
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @survey = @answer.survey
    if is_owner?(@answer)
      if @answer.update(answer_params)
        redirect_to survey_path(@survey)
      else
        render 'edit'
      end
    else
      redirect_to survey_path(@survey)
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @survey = @answer.survey
    if is_owner?(@answer)
      @answer.destroy
      redirect_to survey_path(@survey)
    else
      redirect_to survey_path(@survey)
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:answer)
  end
end
