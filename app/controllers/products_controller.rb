class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).where(published: true)
  end
end
