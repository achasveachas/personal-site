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

  def blog_post
    @blog_post = BlogPost.find_by(slug: params[:slug])
    if @blog_post
      redirect_to @blog_post.url
    else
      flash[:error] = "Sorry, there is no blog post with the #{params[:slug]} slug."
      redirect_to root_path
    end
  end

  def resume
    send_file "app/views/website/Yechiel-Kalmenson-Resume.pdf"
  end

  def torah_tech
    redirect_to SocialLinks.torah_tech
  end

  def magic
  end

end
