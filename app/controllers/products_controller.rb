class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /products
  # GET /products.json
  def index
    @items_per_row = 3
    if params[:q]
      search_term = params[:q] # return our filtered list here
      products_to_show = Product.search(search_term)
      # if(Rails.cache.read('product_#{search_term}'))
      #   @product_count = Rails.cache.read('product_#{search_term}')
      # else
      #   @product_count = products_to_show.count
      #   Rails.cache.write('product_#{search_term}', @product_count)
      # end
    else
      products_to_show = Product.all
      # if(Rails.cache.read('products'))
      #   @product_count = Rails.cache.read('products')
      # else
      #   @product_count = products_to_show.count
      #   Rails.cache.write('products', @product_count)
      # end
    end
    @products = products_to_show.paginate(:page => params[:page], :per_page => 9)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments.order("rating DESC").paginate(:page => params[:page], :per_page => 3)
    @product.viewed!
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_path(@product), notice: 'Product was successfully created.'}
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :colour, :price)
    end
end
