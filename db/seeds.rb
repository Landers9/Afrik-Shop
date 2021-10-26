(1..5).each do |x|
    User.create!(email: "abc#{x}@gmail.com", password: "azerty", username:"users#{x}", address:"lieu#{x}", telephone:"17829176#{x}")
    Category.create(name: "category#{x}")
end

User.create!(username: 'Guest User', email: 'guest@example.com', password: 'azerty', password_confirmation: 'azerty', address:"Cotonou", telephone:"22917829176", guest: true)

User.create!(username: 'Guest User Admin', email: 'guestadmin@example.com', password: 'azerty', password_confirmation: 'azerty', address:"Parakou", telephone:"22917829176", admin:true, guest: true)



# (1..5).each do |x|
#   Product.create!(name: "T-shirt Red Guici-#{x}", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", category_id: Random.rand(1..5), price: Random.rand(30..115))
# end


# (3..7).each do |x|
#   Favory.create!(product_id: Product.last.id, user_id: User.last.id)
#   Card.create(product_id: Product.last.id, user_id: User.last.id, quantity: Random.rand(1..2), total_price: Random.rand(30..115))
#   Order.create(user_id: User.last.id, qt_product: Random.rand(1..2), total_price: Random.rand(30..115))
#   OrdersProduct.create(order_id: Order.last.id, product_id: Product.last.id)
#   Note.create(order_id: Order.last.id)
# end
