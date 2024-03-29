class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "get stuffed, hackerzzzz"
  end


  helper_method :current_user

  before_filter :setup_search_object
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private
  def setup_search_object

    @q = Recipe.search(params[:q])
  end

end