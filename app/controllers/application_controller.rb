class ApplicationController < ActionController::Base
  # need to make signed in user available to all controllers

  # declare this method as a helper
  helper_method :current_user

  private

  def current_user
    if session[:user_id]
      # neu @current_user da ton tai thi return ve no, con ko ton tai thi find() tu csdl
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize
    redirect_to new_session_path, alert: 'Please Sign In or Sign Up!' if current_user.nil?
  end

  def admin_authorize
    redirect_to new_session_path, alert: "Only for Admin" unless current_user && current_user.admin
  end

end
