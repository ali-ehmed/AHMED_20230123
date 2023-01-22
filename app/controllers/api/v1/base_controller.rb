module Api
  module V1
    class BaseController < ApplicationController
      include ActiveStorage::SetCurrent
    end
  end
end
