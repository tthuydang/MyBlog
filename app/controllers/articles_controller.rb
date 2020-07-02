class ArticlesController < ApplicationController

  def new
  end

  # bắt sự kiện submit
  def create
    render plain: params[:article].inspect
  end
end
