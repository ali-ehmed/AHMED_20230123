require 'rails_helper'

RSpec.describe(VideoSerializer) do
  subject { described_class.new(video).serializable_hash }
  let!(:video) { create(:video) }

  context 'Attributes' do
    it 'verifies the serializer attributes' do
      data = subject[:data]
      expect(data[:id]).to(eql(video.id.to_s))
      expect(data[:attributes][:title]).to(eql(video.title))
      expect(data[:attributes][:category][:id]).to(eql(video.category_id))
      expect(data[:attributes][:videoClipUrl]).to(eql(Rails.application.routes.url_helpers.rails_blob_path(video.clip, only_path: true)))
      expect(data[:attributes][:videoClipContentType]).to(eql(video.clip.content_type))
      expect(data[:attributes][:videoClipThumbnail]).to(be_url)
    end
  end
end
