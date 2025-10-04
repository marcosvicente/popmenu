require 'rails_helper'

RSpec.describe "MenuItems", type: :request do
  describe "GET /index" do
    let!(:menu_item) { create_list(:menu_item, 10) }

    context "success" do
      it "should be return all menu_items" do
        get "/menu_items/"

        expect(response).to have_http_status(:success)
        expect(response_body["data"]).to be_an_instance_of(Array)
      end

      it "should  be return all menu_items with paginate" do
        get "/menu_items/",
            params: { page: 2, per_page: 5 }

        expect(response).to have_http_status(:success)

        expect(response_body["data"].size).to eq(5)
      end
    end
  end
end
