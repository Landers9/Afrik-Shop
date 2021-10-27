FactoryBot.define do
  factory :product do
    name {"product1"}
    description {"product1 description 1"}
    image {nil}
    category { nil }
    price { 123 }
  end
end
