class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).where(published: true)
  end

  def show
    @product = Product.find(params[:id])
  end
end
