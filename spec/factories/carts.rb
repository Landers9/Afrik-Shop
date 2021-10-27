FactoryBot.define do
  factory :cart do
    product {nil}
    user {nil}
    quantity {2}
    total_price {123}
  end
end
