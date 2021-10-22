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
    redirect_to products_path()
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

  # # GET /carts or /carts.json
  # def index
  #   @carts = Cart.all
  # end
  #
  # # GET /carts/1 or /carts/1.json
  # def show
  # end
  #
  # # GET /carts/new
  # def new
  #   @cart = Cart.new
  # end
  #
  # # GET /carts/1/edit
  # def edit
  # end
  #
  # # POST /carts or /carts.json
  # def create
  #   @cart = Cart.new(cart_params)
  #
  #   respond_to do |format|
  #     if @cart.save
  #       format.html { redirect_to @cart, notice: "Cart was successfully created." }
  #       format.json { render :show, status: :created, location: @cart }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @cart.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /carts/1 or /carts/1.json

  #
  # # DELETE /carts/1 or /carts/1.json
  # def destroy
  #   @cart.destroy
  #   respond_to do |format|
  #     format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end
  #
