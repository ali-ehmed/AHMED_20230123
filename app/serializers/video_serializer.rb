class VideoSerializer
  include JSONAPI::Serializer

  set_key_transform :camel_lower

  attributes :title, :category

  attribute :video_url do |object|
    Rails.application.routes.url_helpers.rails_blob_path(object.clip, only_path: true)
  end

  attribute :thumbnail do |object|
    object.sized(:thumbnail).url
  end
end
