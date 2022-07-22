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

    it "When weapons created successfully" do
      weapon = build(:weapon)
      post "/weapons/", params: { weapon: {name: weapon.name, description: weapon.description, power_base: weapon.power_base, power_step: weapon.power_step, level: weapon.level}}
      expect(response).to have_http_status(:redirect)
      get "/weapons", params: {id:1}
      expect(response.body).to include("Weapon was successfully created.")
    end

    it "When weapons created not successfully" do
      weapon = build(:weapon, level: FFaker::Random.rand(-100..-1))

      post "/weapons/", params: { weapon: {name: weapon.name, description: weapon.description, power_base: weapon.power_base, power_step: weapon.power_step, level: weapon.level}}
      
      expect(response).to have_http_status(:unprocessable_entity)

      expect(response.body).to include("1 error prohibited this weapon from being saved")
    end

    it "returns http success" do
      get "/weapons/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      weapon = create(:weapon)
      get "/weapons/", params: {id:weapon.id}
      expect(response).to have_http_status(:success)
      expect(response.body).to include(weapon.name)
      expect(response.body).to include(weapon.description)
      expect(response.body).to include(weapon.level.to_s)
      expect(response.body).to include(weapon.power_step.to_s)
      expect(response.body).to include(weapon.current_power.to_s)
      expect(response.body).to include(weapon.title)
    end
  end

  describe "delete route" do
    it "returns http success" do
      weapon = create(:weapon)
      delete "/weapons/#{weapon.id}"
      expect(response).to have_http_status(:redirect)
      get "/weapons/"
      expect(response.body).to include("Weapon was successfully destroyed.")
    end
  end
end
