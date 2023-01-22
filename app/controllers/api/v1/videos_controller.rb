module Api
  module V1
    class VideosController < BaseController
      def index
        @videos = Video.order(created_at: :desc)
        render json: { data: VideoSerializer.new(@videos).serializable_hash }
      end

      def create
        @video = Video.create!(videos_params)
        render json: { data: VideoSerializer.new(@video).serializable_hash }
      rescue ActiveRecord::RecordInvalid => e
        render json: { errors: { details: Array.wrap(e.record.errors.full_messages) } }, status: :bad_request
      end

      private

      def videos_params
        params.permit(:title, :category_id, :clip)
      end
    end
  end
end
