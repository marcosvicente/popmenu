require 'rails_helper'

RSpec.describe "Restaurants", type: :request do
  describe "GET /index" do
    let!(:restaurant) { create_list(:restaurant, 10) }
    context "success" do
      it "should be return all menu" do
        get "/restaurants/"

        expect(response).to have_http_status(:success)
        expect(response_body["data"]).to be_an_instance_of(Array)
      end

      it "should  be return all menu with paginate" do
        get "/restaurants/",
            params: { page: 2, per_page: 5 }

        expect(response).to have_http_status(:success)
        expect(response_body["data"].size).to eq(5)
      end
    end
  end
end
