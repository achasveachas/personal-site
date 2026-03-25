class Talk < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :conference_name, presence: true
  validates :talk_date, presence: true
  validates :youtube_link, format: { with: URI::regexp(%w[http https]) }, allow_blank: true
  validates :blog_post_link, format: { with: URI::regexp(%w[http https]) }, allow_blank: true
  validates :picture_url, format: { with: URI::regexp(%w[http https]) }, allow_blank: true
  
  # Either youtube_link OR picture_url must be present
  validate :must_have_video_or_picture
  # If blog_post_link is present, blog_post_title must also be present
  validate :blog_post_title_required_when_link_present
  
  scope :ordered, -> { order(talk_date: :desc) }

  def thumbnail_url
    if youtube_link.present?
      extract_youtube_thumbnail
    else
      picture_url
    end
  end

  def alt_text_or_title
    alt_text.present? ? alt_text : title
  end

  def clickable?
    youtube_link.present?
  end

  def has_blog_post?
    blog_post_link.present?
  end

  private

  def must_have_video_or_picture
    if youtube_link.blank? && picture_url.blank?
      errors.add(:base, "Must have either a YouTube link or a picture URL")
    end
  end

  def blog_post_title_required_when_link_present
    if blog_post_link.present? && blog_post_title.blank?
      errors.add(:blog_post_title, "must be provided when blog post link is present")
    end
  end

  def extract_youtube_thumbnail
    return nil unless youtube_link.present?
    
    match = youtube_link.match(/(?:youtube\.com\/(?:watch\?v=|embed\/)|youtu\.be\/)([a-zA-Z0-9_-]{11})/)
    return nil unless match
    
    video_id = match[1]
    "https://img.youtube.com/vi/#{video_id}/maxresdefault.jpg"
  end
end