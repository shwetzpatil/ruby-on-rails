class SimplePagesController < ApplicationController

  def index
    @product = Product.new
  end

  def landing_page
    @products = Product.limit(3)
  end

end
