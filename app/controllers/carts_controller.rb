class CartsController < ApplicationController

  def index
    @carts = current_user.carts.all
    @tax = 20

    @subtotal = 0

    @carts.each do |c|
      @subtotal = @subtotal + c.total_price
    end

    @total = @subtotal + @tax
  end

  def create
    cart = current_user.carts.create(product_id: params[:id], user_id: current_user.id)
    redirect_to carts_path()
  end

  def destroy
    cart = current_user.carts.find_by(user_id: current_user.id, product_id: params[:id]).destroy
    redirect_to carts_path()
  end

  def update
    @cart = current_user.carts.find(params[:id])
    @cart.update(cart_params)
    @cart.total_price = @cart.quantity * @cart.product.price
    redirect_to carts_path
    @cart.save
  end

  private

    def cart_params
      params.require(:cart).permit(:quantity)
    end
end
