# frozen_string_literal: true
class ArticlesController < ApplicationController

  def new; end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]) # id duoc tao tu dong va tang dan cho moi doi tuong Article dc tao ra
  end

  # hien thi trang edit
  def edit
    @article = Article.find(params[:id])
  end

  # thuc hien update
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params) == true
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  # bắt sự kiện submit
  def create
    # render plain: params[:article].inspect

    # cach 1:
    # @article = Article.create(article_params)

    # cach 2:
    @article = Article.new(article_params)
    @article.save

    redirect_to @article # this will redirect it to the show page and display the article we just created
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
