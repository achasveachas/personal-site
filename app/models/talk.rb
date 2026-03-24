class Talk < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :conference_name, presence: true
  validates :talk_date, presence: true
  
  # Either youtube_link OR picture_url must be present
  validate :must_have_video_or_picture
  
  scope :ordered, -> { order(talk_date: :desc) }

  def thumbnail_url
    if youtube_link.present?
      extract_youtube_thumbnail
    else
      picture_url
    end
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

  def extract_youtube_thumbnail
    return nil unless youtube_link.present?
    
    if youtube_link.match(/(?:youtube\.com\/watch\?v=|youtu\.be\/)([^&\n?#]+)/)
      video_id = $1
      "https://img.youtube.com/vi/#{video_id}/maxresdefault.jpg"
    end
  end
end