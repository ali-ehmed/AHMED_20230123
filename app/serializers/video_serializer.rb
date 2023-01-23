class VideoSerializer
  include JSONAPI::Serializer

  set_key_transform :camel_lower

  attributes :title, :category

  attribute :video_clip_url do |object|
    Rails.application.routes.url_helpers.rails_blob_path(object.clip, only_path: true)
  end

  attribute :video_clip_content_type do |object|
    object.clip.content_type
  end

  attribute :video_clip_thumbnail do |object|
    if object.clip.previewable?
      object.sized(:thumbnail).url
    end
  end
end
