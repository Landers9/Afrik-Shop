(1..5).each do |x|
    User.create!(email: "abc#{x}@gmail.com", password: "azerty", username:"users#{x}", address:"lieu#{x}", telephone:"17829176#{x}")
    Category.create(name: "category#{x}")
end

(1..5).each do |x|
  Product.create!(name: "T-shirt Red Guici-#{x}", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", category_id: Random.rand(1..5), price: Random.rand(30..115))
end


(3..7).each do |x|
  Favory.create!(product_id: Product.last.id, user_id: User.last.id)
  Card.create(product_id: Product.last.id, user_id: User.last.id, quantity: Random.rand(1..2), total_price: Random.rand(30..115))
  Order.create(user_id: User.last.id, qt_product: Random.rand(1..2), total_price: Random.rand(30..115))
  OrdersProduct.create(order_id: Order.last.id, product_id: Product.last.id)
  Note.create(order_id: Order.last.id)
end
