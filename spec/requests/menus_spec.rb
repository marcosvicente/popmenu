require 'rails_helper'

RSpec.describe "Menus", type: :request do
  describe "GET /index" do
    let!(:menu) { create_list(:menu, 10) }

    context "success" do
      it "should be return all menu" do
        get "/menus/"

        expect(response).to have_http_status(:success)
        expect(response_body["data"]).to be_an_instance_of(Array)
      end

      it "should  be return all menu with paginate" do
        get "/menus/",
          params: { page: 2, per_page: 5 }

        expect(response).to have_http_status(:success)

        expect(response_body["data"].size).to eq(5)
      end
    end
  end
end
