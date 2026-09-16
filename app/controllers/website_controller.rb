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

  def talks
    @talks = Talk.ordered
  end

  def blog
    redirect_to SocialLinks.blog
  end

  def blog_post
    @blog_post = BlogPost.find_by(slug: params[:slug])
    if @blog_post
      PostHog.capture(
        event: 'blog_post_opened',
        properties: { blog_post_id: @blog_post.id }
      )
      redirect_to @blog_post.url
    else
      flash[:error] = "Sorry, there is no blog post with the #{params[:slug]} slug."
      redirect_to root_path
    end
  end

  def resume
    PostHog.capture({
      distinct_id: 'anonymous',
      event: 'resume_downloaded',
      properties: {
        '$ip' => request.remote_ip,
        '$referrer' => request.referer,
        '$referring_domain' => begin
          URI.parse(request.referer || '').host
          rescue URI::InvalidURIError
          nil
        end
      }
    })
    send_file "app/views/website/Yechiel-Kalmenson-Resume.pdf"
  end

  def torah_tech
    redirect_to SocialLinks.torah_tech
  end

  def magic
  end

end
