class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    if original_url
      if original_url == "desc"
        @products = Product.search(params).paginate(:page => params[:page], :per_page => 10).order('price DESC')
      elsif  original_url == "asc"
        @products = Product.search(params).paginate(:page => params[:page], :per_page => 10).order('price ASC')
      elsif  original_url == "new"
        @products = Product.search(params).paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
      elsif  original_url == "discount"
        @products = Product.search(params).paginate(:page => params[:page], :per_page => 10).order('discount DESC')
      elsif  original_url == "down100"
        @products = Product.where("price < 100000").search(params).paginate(:page => params[:page], :per_page => 10)
      elsif  original_url == "100-200"
        @products = Product.where("price > 100000").where("price < 200000").search(params).paginate(:page => params[:page], :per_page => 10)
      elsif  original_url == "200-300"
        @products = Product.where("price > 200000").where("price < 300000").search(params).paginate(:page => params[:page], :per_page => 10)
      elsif  original_url == "300-500"
        @products = Product.where("price > 300000").where("price < 500000").search(params).paginate(:page => params[:page], :per_page => 10)
      elsif  original_url == "up500"
        @products = Product.where("price > 500000").search(params).paginate(:page => params[:page], :per_page => 10)
      else
        @products = Product.search(params).paginate(:page => params[:page], :per_page => 10)
      end
    else
      @products = Product.search(params).paginate(:page => params[:page], :per_page => 10)
    end
  end

  def original_url
    url = request.host + request.fullpath
    uri = URI.parse(url)
    if uri.query
      params = CGI.parse(uri.query)
      sort = params['sort'].first
    end
  end



  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    authorize
    @product = Product.new
  end


  # GET /products/1/edit
  def edit
    authorize
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def search  
    if params[:search].blank?  
      redirect_to(root_path, notice: "Sản phẩm của bạn tìm kiếm hiện không có!") and return  
    else  

    end  
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    authorize
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    authorize
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price, :image_url1, :image_url2, :discount, :idDM)
    end
end
