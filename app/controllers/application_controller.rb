class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :get_page_title, :require_admin, :is_admin?, :track_action
  before_action :block_spam

  private

  def block_spam
    if request.referer&.include?(".ru") && !request.referer&.include?("yandex")
      current_visit.delete
      head 403 
    end
  end

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
