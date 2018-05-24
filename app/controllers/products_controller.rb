class ProductsController < ApplicationController
  before_action :get_product, only: [:update, :show, :edit, :destroy]

  def index
    @products = Product.includes(:category).where(published: true)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    return redirect_to products_url, notice: 'You have created product successfully' if @product.save
    flash.now[:notice] = "Have somes errors"
    render :new
  end

  def edit
    render :new
  end

  def update
    return redirect_to products_url, notice: 'You have updated product successfully' if @product.update(product_params)
    flash.now[:notice] = "Have somes errors"
    render :new
  end

  def destroy
    return redirect_to products_path, notice: "Delete #{@product.title} successfully" if @product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :published, :category_id, :country)
  end

  def get_product
    @product = Product.find(params[:id])
  end
end
