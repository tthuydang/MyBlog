class SessionsController < ApplicationController

  def index
    redirect_to root_path
  end

  def new
  end

  # bam login
  def create
    user = User.find_by_userid(params[:userid])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome #{user.userid}, you successfuly signed in"
    else
      render 'new', alert: "User ID and/or Password Invalid"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You successfully Logged Out"
  end

end
