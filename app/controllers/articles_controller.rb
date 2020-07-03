class ArticlesController < ApplicationController

  def new; end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]) # id duoc tao tu dong va tang dan cho moi doi tuong Article dc tao ra
  end

  # bắt sự kiện submit
  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save

    redirect_to @article # this will redirect it to the show page and display the article we just created
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
