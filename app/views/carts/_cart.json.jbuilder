json.extract! cart, :id, :sum_price, :number_product, :product_id, :user_id, :created_at, :updated_at
json.url cart_url(cart, format: :json)
