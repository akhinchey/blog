class ArticlesController < ApplicationController

  def index
    @articles = Article.all 
  end

  def new
  end

  def edit
    @article = Article.find_by(id: params[:id])
  end

  def update
    @article = Article.find_by(id: params[:id])

    @article.update(article_params)
    redirect_to @article 
  end

  def create
    
    @article = Article.new(article_params)
 
    @article.save
    redirect_to @article
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.destroy

    redirect_to articles_path
  end
 
private

  def article_params
    params.require(:article).permit(:title, :text)
  end


end
