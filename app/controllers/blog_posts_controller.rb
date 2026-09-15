class BlogPostsController < ApplicationController
  def create
    @blogpost = BlogPost.new(blog_post_params)
    @blogpost.slug = @blogpost.slug.downcase.gsub(' ', '-')
    if @blogpost.save
      PostHog.capture(
        event: 'blog_post_created',
        properties: { blog_post_id: @blogpost.id }
      )
    else
      flash[:error] = @blogpost.errors.full_messages.join(", ")
    end
    redirect_to admin_root_path
  end

  def destroy
    @blogpost = BlogPost.find_by(id: params[:id])
    @blogpost.destroy
    PostHog.capture(
      event: 'blog_post_deleted',
      properties: { blog_post_id: @blogpost.id }
    )
    redirect_to admin_root_path
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :url, :slug)
  end
end
