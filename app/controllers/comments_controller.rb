class CommentsController < ApplicationController
  before_action :authorize, :only => [:create]
  before_action :admin_authorize, :only => [:destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params) # comments la 1 function chu ko phai thuoc tinh, va cung ko phai la 1 mang cho nen ko goi ham append/add dc

    if @comment.save
      # truyen @article qua cho trang show su dung
      redirect_to article_path(@article), notice: "You successfully created a comment."
    else
      # truyen @article qua cho trang show su dung
      redirect_to article_path(@article), notice: "Comment could not be created."
    end
  end

  # for admin authorization
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
