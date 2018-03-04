class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :get_page_title, :require_admin, :is_admin?
  before_action :log_session

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

  def log_session
    if !is_admin?
      log = SessionLog.new
      log.company = params[:company] if params[:company]
      data = request.location.data
      location = [data['city'], data['state'], data['zipcode'], data['country_name']].select{|i| i && !i.empty?}.join(', ')
      log.location = location
      log.ip = data['ip']
      log.save
    end
  end
end
