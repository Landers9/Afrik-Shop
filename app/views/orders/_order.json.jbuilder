json.extract! order, :id, :total_price, :qt_product, :product_id, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
