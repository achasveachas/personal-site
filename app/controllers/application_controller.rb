class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :get_page_title

  private

  def get_page_title
    params[:action].capitalize
  end
end
