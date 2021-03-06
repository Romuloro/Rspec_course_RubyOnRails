FactoryBot.define do
  factory :weapon do
    name {FFaker::Lorem.word}
    description {FFaker::Lorem.word}
    power_base {FFaker::Random.rand(100..350)}
    power_step {FFaker::Random.rand(400..1000)}
    level {FFaker::Random.rand(0..99999)}
  end
end
