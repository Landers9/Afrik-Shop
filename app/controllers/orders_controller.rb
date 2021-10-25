class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = current_user.orders.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    commands = current_user.carts.all
    @order = Order.new()
    @total = 20
    @qtproduct = 0
    commands.each do |c|
      @total = @total + c.total_price
      @qtproduct = @qtproduct + c.quantity
    end
    @order.total_price = @total
    @order.qt_product = @qtproduct
    @order.user_id = current_user.id
    @order.save

    commands.each do |c|
      @cmde = OrdersProduct.new()
      @cmde.order_id = @order.id
      @cmde.product_id = c.product.id
      @cmde.save
    end

    if @order.total_price > 20
      redirect_to orders_path

    else
      redirect_to carts_path
    end

    d = commands.delete_all
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    order = current_user.orders.find_by(user_id: current_user.id, id: params[:id]).destroy
    redirect_to orders_path()
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:total_price, :qt_product, :product_id, :user_id)
    end
end
