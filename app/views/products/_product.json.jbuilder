json.extract! product, :id, :name, :description, :image, :price, :references, :created_at, :updated_at
json.url product_url(product, format: :json)
