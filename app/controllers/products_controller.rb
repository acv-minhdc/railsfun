class ProductsController < ApplicationController

  def index
    @products = Product.includes(:category).where(published: true)
  end

  def show
    @product = Product.find(params[:id])
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

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :published, :category_id, :country)
  end
end
