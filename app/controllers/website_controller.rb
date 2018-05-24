class WebsiteController < ApplicationController
  before_action :get_page_title
  after_action :track_action, unless: :is_admin?


  def index

  end

  def contact
  end

  def projects
    @projects = Project.all.reverse_order
  end

  def blog
    redirect_to SocialLinks.blog
  end

  def resume
    send_file "app/views/website/Yechiel-Kalmenson-Resume.pdf"
  end

  def magic
  end
end
