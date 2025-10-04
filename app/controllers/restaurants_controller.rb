class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.order(:created_at).page(params[:page]).per(params[:per_page])

    render json: {
      data: @restaurants,
      meta: {
        current_page: @restaurants.current_page,
        next_page: @restaurants.next_page,
        prev_page: @restaurants.prev_page,
        total_pages: @restaurants.total_pages,
        total_count: @restaurants.total_count
      }
    }
  end
end
