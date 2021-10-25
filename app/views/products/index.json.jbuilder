json.array! @products, partial: "products/product", as: :product


<div class="small-container" style="margin-top:30px;">
  <h2 class="title" id="">Favorites Products</h2>
  <div class="row">
    <% @favories.each do |f| %>
      <div class="col-4">
        <a href="<%= product_path(f.product.id) %>">
          <img src="<%= f.product.image.url %>" alt="">
        </a>
        <h4><%= f.product.name %></h4>
        <div class="rating">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bx-star' ></i>
        </div>
        <p><%= f.product.price %> $</p>
        <a href="<%= delete_favory_path(id: f.id) %>" class="favory-add" style="background:red;">Delete</a>
      </div>
    <% end %>
  </div>
</div>
