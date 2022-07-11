require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "is invalid if the level" do
    expect(User.create(nickname: "Rominkg", kind: :wizard, level: 100)).to_not be_valid
  end

  it "return the correct hero title" do
    user = User.create(nickname: "Rominkg", kind: :ladino, level: 50)
    expect(user.title).to eq("ladino Rominkg #50")
  end
end
