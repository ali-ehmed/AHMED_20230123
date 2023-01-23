require 'rails_helper'

RSpec.describe(Api::V1::VideosController, type: :controller) do
  describe '#index' do
    subject do
      get :index
    end

    let!(:video) { create_list(:video, 5) }

    it 'returns list of videos' do
      subject

      expect(response.ok?).to(be(true))
      body = JSON.parse(response.body)
      expect(body['data'].count).to(eql(5))
    end
  end

  describe '#create' do
    let(:category) { create(:category) }
    let(:file) { fixture_file_upload(File.open(Rails.root.join('db', 'data', 'Chocolate Macarons Recipe.mp4'))) }

    subject do
      post :create, params: params
    end

    context 'When params are valid' do
      let(:params) do
        {
          title: Faker::Dessert.variety,
          category_id: category.id,
          clip: file
        }
      end

      it 'returns 200' do
        subject

        expect(response.ok?).to(be(true))
        expect(response.status).to(eql(200))
      end
    end

    context 'When params are invalid' do
      let(:video) { build(:video, title: nil, category: nil) }
      let(:params) do
        {}
      end

      before do
        video.clip = nil
        video.valid?
      end

      it 'returns 400' do
        subject

        expect(response.ok?).to(be_falsey)
        expect(response.status).to(eql(400))
        body = JSON.parse(response.body)
        expect(body['errors']).to(eql(video.errors.full_messages.to_sentence))
      end
    end
  end
end