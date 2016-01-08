class SurveysController < ApplicationController
  def index
    @surveys = Survey.all.paginate(page: params[:page], per_page: 10)
  end


  def new
    @user = User.find_by(id: session[:user_id])
    @survey = @user.surveys.new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @survey = @user.surveys.create(survey_params)

    if @survey.save
      redirect_to survey_path(@survey)
    else
      render 'new'
    end
  end

  def show
    @survey = Survey.find(params[:id])
    @survey.view += 1
    @survey.save
    @answers = @survey.answers.all
    @my_answers = @survey.answers.where(user_id: session[:user_id])
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if current_user == @survey.user
      if @survey.update(survey_params)
        redirect_to survey_path(@survey)
      else
        render 'edit'
      end
    else
      redirect_to survey_path(@survey)
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    if current_user = @survey.user
      @survey.destroy
      redirect_to private_feedback_path
    else
      redirect_to survey_path(@survey)
    end
  end


  private
  def survey_params
    params.require(:survey).permit(:title, :question, :image, :remote_image_url)
  end

end
