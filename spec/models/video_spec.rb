require 'rails_helper'

RSpec.describe Video, type: :model do
  subject { build(:video) }

  context 'Validations' do
    it 'is valid' do
      expect(subject).to be_valid
    end

    it 'is invalid without title' do
      subject.title = nil
      expect(subject).to be_invalid
    end

    it 'is invalid with invalid title length' do
      subject.title = Faker::Lorem.paragraph
      expect(subject).to be_invalid
    end

    it 'is invalid without clip' do
      subject.clip = nil
      expect(subject).to be_invalid
    end

    it 'is invalid with invalid clip content type' do
      subject
        .clip
        .attach(
          io: File.open(Rails.root.join('db', 'data', 'sample.jpeg')),
          filename: 'sample image'
        )
      expect(subject).to be_invalid
    end

    it 'is valid with mp4 and mov file type' do
      subject
        .clip
        .attach(
          io: File.open(Rails.root.join('db', 'data', '4_Easy_Meals_To_Start_Cooking.mov')),
          filename: 'video'
        )
      expect(subject).to be_valid

      subject
        .clip
        .attach(
          io: File.open(Rails.root.join('db', 'data', 'Education_For_Life.mp4')),
          filename: 'video'
        )

      expect(subject).to be_valid
    end
  end

  describe '#clip' do
    subject { create(:video).clip }

    it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }

    it "is attached" do
      expect(subject).to be_attached
    end
  end

  context 'Instance Methods' do
    subject { create(:video) }

    describe '#sized' do
      it 'generates preview in small size' do
        expect(subject.sized(:small).variation.transformations).to(eql(subject::class::VIDEO_CLIP_SIZES[:small]))
      end

      it 'generates preview in medium size' do
        expect(subject.sized(:medium).variation.transformations).to(eql(subject::class::VIDEO_CLIP_SIZES[:medium]))
      end

      it 'generates preview in thumbnail size' do
        expect(subject.sized(:thumbnail).variation.transformations).to(eql(subject::class::VIDEO_CLIP_SIZES[:thumbnail]))
      end

      it 'raise error on invalid size' do
        expect {
          subject.sized(:hello)
        }.to raise_error(ArgumentError, "Invalid Size")
      end
    end
  end

  context 'Callbacks' do
    subject { build(:video) }

    context 'After create commit' do
      describe '#sanitize_filename!' do
        it 'sanitizes the file name' do
          subject
            .clip
            .attach(
              io: File.open(Rails.root.join('db', 'data', '4_Easy_Meals_To_Start_Cooking.mov')),
              filename: 'file/file'
            )

          subject.save
          expect(subject.clip.filename.to_s).to(eql('file-file'))
        end
      end
    end
  end
end
