class Video < ApplicationRecord
  VIDEO_CLIP_SIZES = {
    small: { resize: "64x64" },
    medium: { resize: "128x128" },
    thumbnail: { resize: "256x256" },
  }

  belongs_to :category
  has_one_attached :clip

  validates :title, presence: true, length: { in: 3..40 }
  validates :clip, presence: true, blob: { content_type: %w(video/quicktime video/mp4), size_range: 1..(200.megabytes) }

  after_create_commit :sanitize_filename!

  def sized(size)
    clip.preview(VIDEO_CLIP_SIZES[size]).processed
  rescue StandardError
    raise ArgumentError, 'Invalid Size'
  end

  private

  def clip_content_type
    return if %w(video/quicktime video/mp4).include?(clip.content_type)

    errors.add(:clip, 'Must be a MP4 or a MOV file')
  end

  def sanitize_filename!
    blob = clip.blob
    blob.filename = blob.filename.sanitized
    blob.save!
  end
end
