class Talk < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :conference_name, presence: true
  validates :talk_date, presence: true
  validates :youtube_link, format: { with: URI::regexp(%w[http https]) }, allow_blank: true
  validates :blog_post_link, format: { with: URI::regexp(%w[http https]) }, allow_blank: true
  validates :picture_url, format: { with: URI::regexp(%w[http https]) }, 
            allow_blank: true, if: :external_picture_url?
  validates :picture_url, format: { with: /\A[\w\-\.\/]+\.(jpe?g|png|gif|webp)\z/i,
            message: "must be a valid asset path to an image file" },
            allow_blank: true, unless: :external_picture_url?
  
  validate :must_have_video_or_picture
  validate :blog_post_title_required_when_link_present
  
  scope :ordered, -> { order(talk_date: :desc) }

  def thumbnail_url
    if youtube_link.present?
      extract_youtube_thumbnail
    else
      picture_url
    end
  end

  def safe_thumbnail_url
    if youtube_link.present?
      extract_youtube_thumbnail
    elsif is_asset_path?
      begin
        # Remove leading slash if present for asset_url
        asset_path = picture_url.gsub(/\A\//, '')
        ActionController::Base.helpers.asset_url(asset_path)
      rescue => e
        Rails.logger.error "Asset URL generation failed for #{picture_url}: #{e.message}"
        picture_url # Fallback to original path
      end
    else
      picture_url
    end
  end

  def is_asset_path?
    picture_url.present? && !picture_url.match(/\Ahttps?:\/\//)
  end

  def external_picture_url?
    picture_url.present? && picture_url.match(/\Ahttps?:\/\//)
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
    "https://img.youtube.com/vi/#{video_id}/hqdefault.jpg"
  end
end