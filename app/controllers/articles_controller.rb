class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
 
  def show
    @article = Article.find(params[:id])
  end
  def new
  end
  def edit
    @article = Article.find(params[:id])
  end
  def create
    # article.new calls the article_param method defined as private
    @article = Article.new(article_params)
   
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    # article.new calls the article_param method defined as private
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  private
    #method article_params added both requires and permits text and title for articles
  def article_params
      params.require(:article).permit(:title, :text)
    end
end
