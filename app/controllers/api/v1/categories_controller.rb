module Api
  module V1
    class CategoriesController < BaseController
      def index
        @categories = Category.all
        render json: CategorySerializer.new(@categories).serializable_hash
      end
    end
  end
end
