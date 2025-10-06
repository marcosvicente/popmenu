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

  def import_json_data
    restaurant = ImportJsonJob.perform_now(restaurant_import_json_data_params[:file])
    if restaurant.valid?
      render json: restaurant, status: :created
    else
      render json: restaurant.errors, status: :unprocessable_entity
    end

  end

  private
  def restaurant_import_json_data_params
    params.require(:restaurant).permit(:file)
  end
end
