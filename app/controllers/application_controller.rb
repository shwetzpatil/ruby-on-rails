class ApplicationController < ActionController::Base

  # for customizing error page and messeges
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end

  protect_from_forgery with: :exception
  before_action :set_product_search_obj

  def set_product_search_obj
    @product_search_obj = Product.new
  end
end
