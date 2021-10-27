FactoryBot.define do
  factory :order do
    total_price {123}
    qt_product {2}
    status {'progress'}
    user {nil}
  end
end
