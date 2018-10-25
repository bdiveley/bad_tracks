class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #
  # before_action :set_breadcrumb
  #
  # def set_breadcrumb
  #   @breadcrumbs ||= session[:breadcrumbs]
  #   @breadcrumbs.push(request.path_info)
  # end

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin? 
  end

end
