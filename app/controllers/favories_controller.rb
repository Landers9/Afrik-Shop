class FavoriesController < ApplicationController
  before_action :set_favory, only: %i[ show edit update destroy ]

  # GET /favories or /favories.json
  def index
    @favories = Favory.all
  end

  # GET /favories/1 or /favories/1.json
  def show
  end

  # GET /favories/new
  def new
    @favory = Favory.new
  end

  # GET /favories/1/edit
  def edit
  end

  # POST /favories or /favories.json
  def create
    @favory = Favory.new(favory_params)

    respond_to do |format|
      if @favory.save
        format.html { redirect_to @favory, notice: "Favory was successfully created." }
        format.json { render :show, status: :created, location: @favory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favories/1 or /favories/1.json
  def update
    respond_to do |format|
      if @favory.update(favory_params)
        format.html { redirect_to @favory, notice: "Favory was successfully updated." }
        format.json { render :show, status: :ok, location: @favory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favories/1 or /favories/1.json
  def destroy
    @favory.destroy
    respond_to do |format|
      format.html { redirect_to favories_url, notice: "Favory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favory
      @favory = Favory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favory_params
      params.require(:favory).permit(:product_id)
    end
end
