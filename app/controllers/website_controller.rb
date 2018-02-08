class WebsiteController < ApplicationController
  def index
  end

  def contact
  end

  def projects
  end

  def blog
    redirect_to "https://blog.yechiel.me/"
  end

  def resume
    send_file "app/views/website/Yechiel-Kalmenson-Resume.pdf"
  end
end
