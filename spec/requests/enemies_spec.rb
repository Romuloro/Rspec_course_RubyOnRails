require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  describe "update" do
    context "when the enemy exists" do
      let(:enemy) {create(:enemy)}
      let(:enemy_attributes) {attributes_for(:enemy)}
      before do
        put "/enemies/#{enemy.id}", params: enemy_attributes
      end
      
      it "returns http status code 200" do
        expect(response).to have_http_status(:success)
      end

      it "update the records" do
        expect(enemy.reload).to have_attributes(enemy_attributes)
      end

      it "returns the enemy updated" do
        json_response = JSON.parse(response.body)
        expect(enemy.reload).to have_attributes(json_response.except("created_at", "updated_at"))
      end
    end

    context "when the enemy does not exists" do
      before do
        put "/enemies/0", params: attributes_for(:enemy)
      end
      it "returns http status code 404"do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end

  describe "destroy" do
    let(:enemy) {create(:enemy)}
    context "when the enemy exists" do
      before do
        delete "/enemies/#{enemy.id}"
      end

      it "returns http status 200" do
        expect(response).to have_http_status(204)
      end

      it "destroy the enemy" do
        expect {enemy.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "when the enemy does not exist" do
      before do
        delete "/enemies/0"
      end

      it "returns http status 404" do
        expect(response).to have_http_status(404)
      end

      it"returns a not found message" do
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end

end
