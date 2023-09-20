class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    before_action :category_all

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

    def category_all
    @categories = Category.all
  end
end
