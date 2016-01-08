class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @article = @comment.article
    if current_user == @comment.user
      if @comment.update(comment_params)
        redirect_to article_path(@article)
      else
        render 'edit'
      end
    else
      redirect_to article_path(@article)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @article = @comment.article
    if current_user = @comment.user
      @comment.destroy
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
