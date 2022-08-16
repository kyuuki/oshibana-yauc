FactoryBot.define do
  factory :item do
    sequence(:number) { |i| 1000 + i }
    sequence(:name) { |i| "名前 #{1000 + i}" }
  end

  factory :item_1, class: Item do
    number { 1 }
    name { "名前 1" }
  end
end
