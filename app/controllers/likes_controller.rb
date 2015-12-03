class LikesController < ApplicationController
  def create
    @user = User.find_by(id: session[:user_id])
    @article = Article.find(params[:article_id])
    @like = @article.likes.new
    @like.user_id = @user.id
    if @like.save
      redirect_to article_path(@article)
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @article = @like.article
    if @like.destroy
      redirect_to :back
    end
  end

  def create2
    @user = User.find_by(id: session[:user_id])
    @survey = Survey.find(params[:survey_id])
    @like = @survey.likes.new
    @like.user_id = @user.id
    if @like.save
      redirect_to survey_path(@survey)
    end
  end

  end
