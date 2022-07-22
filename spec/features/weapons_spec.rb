
require 'rails_helper'

RSpec.describe "Weapons", type: :feature do
    describe "GET/ weapon index" do
        context "link page" do
              before do
                weapon = create(:weapon)
                visit "/weapons/"
              end

              it"the weapons's page the New Weapon link is present" do
                expect(page).to have_link(href: '/weapons/new')
              end

              it"the weapons's page the Show this weapon current power is present" do
                expect(page).to have_link(href: "/weapons/1")
              end
            end
    end
end
