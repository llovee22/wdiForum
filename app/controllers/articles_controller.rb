class ArticlesController < ApplicationController
  def index
    @articles = Article.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    if logged_in?
      @article = current_user.articles.new
    else
      redirect_to general_discussion_path
    end
  end

  def create
    @article = current_user.articles.create(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
    @article.view += 1;
    @article.save
    @comments = @article.comments.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if is_owner?(@article)
      if @article.update(article_params)
        redirect_to article_path(@article)
      else
        render 'edit'
      end
    else
      redirect_to article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if is_owner?(@article)
      @article.destroy
      redirect_to general_discussion_path
    else
      redirect_to article_path(@article)
    end
  end

  private
  def article_params
    params.require(:article).permit(:title,:content)
  end

end
