class Video < ApplicationRecord
  VIDEO_CLIP_SIZES = {
    small: { resize: "64x64" },
    medium: { resize: "128x128" },
    thumbnail: { resize: "256x256" },
  }

  belongs_to :category
  has_one_attached :clip

  validates_presence_of :title
  validates :clip, presence: true, blob: { content_type: %w(video/quicktime video/mp4), size_range: 1..(200.megabytes) }

  def sized(size)
    clip.preview(VIDEO_CLIP_SIZES[size]).processed
  end

  private

  def clip_content_type
    return if %w(video/quicktime video/mp4).include?(clip.content_type)

    errors.add(:clip, 'Must be a MP4 or a MOV file')
  end
end
