class MenusController < ApplicationController
  def index
    @menus = Menu.order(:created_at).page(params[:page]).per(params[:per_page])

    render json: {
      data: @menus,
      meta: {
        current_page: @menus.current_page,
        next_page: @menus.next_page,
        prev_page: @menus.prev_page,
        total_pages: @menus.total_pages,
        total_count: @menus.total_count
      }
    }
  end
end
