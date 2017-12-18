class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_product_search_obj

  def set_product_search_obj
    @product_search_obj = Product.new
  end
end
