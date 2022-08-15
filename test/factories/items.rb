FactoryBot.define do
  factory :item do
    sequence(:number) { |i| 1000 + i }
    sequence(:name) { |i| "名前 #{1000 + i}" }
  end
end
