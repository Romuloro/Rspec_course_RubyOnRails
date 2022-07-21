require 'rails_helper'

RSpec.describe "Weapons", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/weapons/"
      expect(response).to have_http_status(:success)
    end

    it"the weapons's name is present" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.name)
      end
    end

    it"the weapons's current power is present" do
      weapons = create_list(:weapon, 2)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.current_power.to_s)
      end
    end

  end

  describe "GET /create" do
    it "returns http success" do
      get "/weapons/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get weapons_path
      expect(response).to have_http_status(:success)
    end
  end
end
