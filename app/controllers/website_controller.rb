class WebsiteController < ApplicationController
  before_action :get_page_title

  def index
  end

  def contact
  end

  def projects
  end

  def blog
    redirect_to SocialLinks.blog
  end

  def resume
    send_file "app/views/website/Yechiel-Kalmenson-Resume.pdf"
  end
end
