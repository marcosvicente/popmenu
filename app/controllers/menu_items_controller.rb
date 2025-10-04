class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.order(:created_at).page(params[:page]).per(params[:per_page])

    render json: {
      data: @menu_items,
      meta: {
        current_page: @menu_items.current_page,
        next_page: @menu_items.next_page,
        prev_page: @menu_items.prev_page,
        total_pages: @menu_items.total_pages,
        total_count: @menu_items.total_count
      }
    }
  end
end
