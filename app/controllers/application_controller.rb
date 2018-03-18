class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :get_page_title, :require_admin, :is_admin?, :track_action
  # before_action :log_session

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


  def track_action
    ahoy.track "Ran action", params
    current_visit.update_attributes(company: params[:company]) if params[:company]
  end
end
