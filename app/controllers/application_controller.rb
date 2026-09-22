class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :get_page_title, :require_admin, :is_admin?, :track_action
  before_action :redirect_to_non_www

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

  def redirect_to_non_www
    if request.host.start_with?('www.')
      redirect_to request.url.sub('www.', ''), status: :moved_permanently
    end
  end
  
  def track_action
    ahoy.track "Ran action", request.path_parameters
    current_visit.update(company: params[:company]) if params[:company]
  end
end
