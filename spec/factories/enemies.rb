FactoryBot.define do
  factory :enemy do
    name { FFaker::Lorem.word }
    power_base { FFaker::Random.rand(100..5000) }
    power_step { FFaker::Random.rand(100..5000) }
    level { FFaker::Random.rand(1..99) }
    kind { %w[globin orc dragon fary demon].sample }
  end
end
