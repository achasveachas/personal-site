class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :get_page_title, :require_admin, :is_admin?

  private

  def get_page_title
    params[:action].capitalize
  end

  def require_admin
    redirect_to login_path unless session[:admin]
  end

  def is_admin?
    session[:admin]
  end
end
