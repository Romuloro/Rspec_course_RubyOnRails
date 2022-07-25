require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  describe "GET /update" do
    it "returns http success" do
      get "/enemies/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/enemies/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
