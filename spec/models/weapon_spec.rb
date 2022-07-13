require 'rails_helper'

RSpec.describe Weapon, type: :model do
  context "Weapons tests" do
    it"is invalid if the level isn't greater than 0" do
      weapon = build(:weapon, level: FFaker::Random.rand(-9999..-1))
      expect(weapon).to_not be_valid
    end
    
    context "Power Based tests about points" do
      it"is invalid if the power_base isn't lees than 100" do
        weapon = build(:weapon, power_base: FFaker::Random.rand(-9999..99))
        expect(weapon).to_not be_valid
      end

      it"is invalid if the power_base isn't greater than 100" do
        weapon = build(:weapon, power_base: FFaker::Random.rand(351..9999))
        expect(weapon).to_not be_valid
      end
    end
    
    context "Power step tests about points" do
      it"is invalid if the power_step isn't less than 400" do
        weapon = build(:weapon, power_step: FFaker::Random.rand(-9999..399))
        expect(weapon).to_not be_valid
      end

      it"is invalid if the power_step isn't greater than 1000" do
        weapon = build(:weapon, power_step: FFaker::Random.rand(1001..9999))
        expect(weapon).to_not be_valid
      end
    end

    context "return the correct weapon title" do
      it "return the correct weapon title" do
        weapon = build(:weapon)
        expect(weapon.title).to eq("#{weapon.name} ##{weapon.level}")
      end
    end
  end
end
